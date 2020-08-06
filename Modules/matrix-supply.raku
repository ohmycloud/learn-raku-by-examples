#!/usr/bin/env perl6

# ABSTRACT: Draw the green falling characters of a Matrix-like screen, from bottom to up

use Terminal::Print <T>;

my $supplier = Supplier.new;
my $supply = $supplier.Supply;

my @chars = '一'..'二';

start {
    $supply.tap({
        #sleep 0.02;
        my $string-printed;
        last if ^12 .roll == 10;
        until ^42 .roll == 0 {
            unless ^21 .roll == 6 {
                T.print-cell($_[0], $_[1], %( char => @chars.roll, color => 'bold black on_green') );
                $string-printed = True;
                T.print-cell($_[0], $_[1], %( char => @chars.roll, color => 'bold green' ) );
            }
        }

    });
}

#while True {
#    T.initialize-screen;
#
#    await do for 1...^T.rows -> $y {
#        start {
#            for 2,6,10 ... * > T.columns -> $x {
#                $supplier.emit([$x, $y]);
#            }
#        }
#    }
#    T.shutdown-screen;
#}
T.initialize-screen;
while True {

    my @xs = ^T.columns .pick(*).grep({ $_ != 0 && $_ %% 6 }).rotor(5, :partial);
   # my @xs = ^T.columns .pick(*).grep(* % 2).rotor(6, :partial);
    await do for |@xs.pop -> $x {
        start {
            for 1...^T.rows -> $y {
                $supplier.emit([$x, $y]);
            }
        }
    }

}

T.shutdown-screen;