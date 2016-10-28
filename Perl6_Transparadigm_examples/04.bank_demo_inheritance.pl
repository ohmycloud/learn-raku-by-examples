#! /usr/bin/env perl6
use v6;

sub show ($text) {
    say '';
    say ('____/ ' ~ $text ~ ' \_________________________________________________').substr(0,50);
}

use Bank;

my Bank $bank .= new(:ID('123-456-789'), :name('Bank of Evil'));

$bank.add_account: Account.new(:name('Leslie Grace'), :balance( 1_000));
$bank.add_account: Account.new(:name('Dana McKenna'), :balance(10_000));
$bank.add_account: Account.new(:name('Jan van Quod'), :balance( 9_999));

$bank.add_account: Account::Corporate.new(:name('AstroDynamic'), :balance(2e7) :company_ID('ASDY'));
$bank.add_account: Account::Corporate.new(:name('OmniCorp LLC'), :balance(1e6) :company_ID('OMNI'));

show 'Status';
$bank.report;

show 'Taxes collected';
.say for $bank.collect_taxes();

show 'Status';
$bank.report;

$bank.collect_taxes();

show 'Tax records';
$bank.for_each_account({ say .name, ': ', .tax_record });

show 'Culling acounts';
given $bank {
    .for_each_account: {
        .close_account($^account.ID).say
            if $^account.balance < 10_000;
    }
}

show 'Status';
$bank.report;
