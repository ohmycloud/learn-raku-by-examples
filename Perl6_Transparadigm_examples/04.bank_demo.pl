#! /usr/bin/env perl6
use v6;

use Bank;

my Bank $bank .= new(:ID('123-456-789'));

$bank.add_account: Account.new(:name('Leslie Grace')                  );
$bank.add_account: Account.new(:name('Dana McKenna'), :balance(10_000));
$bank.add_account: Account.new(:name('AstroDynamic'), :balance(   2e7));
$bank.add_account: Account.new(:name('Jan van Quod'), :balance( 9_999));
$bank.add_account: Account.new(:name('OmniCorp LLC'), :balance(   1e6));
$bank.report;

$bank.get_account('AAAA00003').deposit(100);
$bank.get_account('Jan van Quod')».deposit(2);
$bank.get_account(/D.na/)».deposit(2);
#$bank.get_account(*)».deposit(99);
$bank.report;

given $bank.close_account('AAAA00005') {
    say "Closed $^account.perl()\n";
    $bank.report;
}

$bank.close_account('ZZZZ99999');

$bank.get_account('AAAA00001').withdraw(1001);
$bank.report;
