#! /usr/bin/env perl6
use v6;

class Ident {
    subset Pattern of Str where / \d**3 '-' \d**3 '-' \d**3 /;

    has Str $.name              = '????';
    has Str $.ID  where Pattern = '000-000-000';
}

role Taxable [:$THRESHOLD = 100_000] {
    constant GENERAL_TAX_RATE = 0.01;

    has %.tax_record;

    method tax_credits {...}

    method calculate_tax () {
        my $tax_payable = ($.balance min $THRESHOLD) * GENERAL_TAX_RATE 
                          - $.tax_credits;

        %!tax_record{now} = $tax_payable;

        return $tax_payable;
    }
}

class Account
    does Taxable
{
    subset ID of Str where / <alpha>**4 <digit>**5 /;

    state ID $next_account_ID = 'AAAA00001';

    has Str     $.name        = die 'Must provide account name';
    has Numeric $.balance     = 0;
    has ID      $.ID          = $next_account_ID++;

    method deposit(Numeric $amount where *>0) {
        $!balance += $amount;
    }

    method withdraw(Numeric $amount where *>0) {
        fail "Insufficient funds to withdraw $amount"
            if $.balance < $amount;
        $!balance -= $amount;
    }

    method description () {
        "$.ID ($.name): balance=$.balance";
    }

    method tax_credits { 0 }
}

class Bank {
    has Ident   $!ident     handles< name ID >;
    has Account %!accounts;

    submethod BUILD (|args) {
        $!ident .= new(|args);
    }

    method add_account(Account $account) {
        %!accounts{$account.ID} = $account;
    }

    method close_account(Str $ID) {
        return %!accounts{$ID} :delete
            // fail "No such account";
    }

    multi method get_account(Account::ID $ID) {
        return %!accounts{$ID} // fail "No such account";
    }

    multi method get_account(Any $name) {
#        return %!accounts.values.grep({.name ~~ $name});
        self.for_each_account({.take if .name ~~ $name});
    }

    method for_each_account (&action_on) {
        gather for %!accounts.values -> $account is rw {
            action_on($account);
        }
    }

    method collect_taxes () {
        self.for_each_account: {
            my $tax = .calculate_tax();
            .withdraw($tax);
            take .ID => $tax;
        }
    }

    method report () {
        say "[ {self.ID} [{self.name}] ]";               # Or: say "[ $.ID [$.name] ]";
        self.for_each_account(*.description.say);
        say '';
    }
}


class Account::Corporate
    is Account
    does Taxable[THRESHOLD => 1_000_000]
{
    has Str $.company_ID;

    method tax_credits { 5_000 }

    method description () {
        callsame() ~ "  [$.company_ID]";
    }
}
