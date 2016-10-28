#! /usr/bin/env perl6
use v6;

use Bank;

my Bank $bank .= new(:ID('123-456-789'));

given $bank {
    .add_account: Account.new(:name('Leslie Grace'), :balance( 1_000));
    .add_account: Account.new(:name('Dana McKenna'), :balance(10_000));
    .add_account: Account.new(:name('AstroDynamic'), :balance(   2e7));
    .add_account: Account.new(:name('Jan van Quod'), :balance( 9_999));
    .add_account: Account.new(:name('OmniCorp LLC'), :balance(   1e6));
    .report;

    .get_account('AAAA00003').deposit(100);
    .report;

    say .close_account('AAAA00005');
    .report;

    .get_account('AAAA00001').withdraw(1001);
    .report;
}
