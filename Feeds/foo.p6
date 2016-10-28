use v6;
use Test;
{
    my ($got_x, $got_y, @got_z);
    sub foo ($x, $y?, *@z) {
        $got_x = $x;
        $got_y = $y;
        @got_z = @z;
    }

    my @a = (1 .. 5);

    @a ==> foo "x";

    is($got_x, "x", "x was passed as explicit param");
    # rakudo 2 todo 'feeds + signatures'
    ok(!defined($got_y), "optional param y was not bound to fed list");
    is(~@got_z, ~@a, '...slurpy array *@z got it');
}

