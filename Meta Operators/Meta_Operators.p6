use v6;

class PowerBy2 {
    has $.number;
	
	method power_by2() {
	    return  $.number ** 2;
	}
}

my  $test = PowerBy2.new(number=>10);
say $test.power_by2;
	
my @a = <1 2 3 4>;
my @b = @a>>.power_by2;
say @b;