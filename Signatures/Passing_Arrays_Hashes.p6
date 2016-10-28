use v6;

# In Perl 6, passing an array or hash works like passing a reference

sub example(@array, %hash) {
    say @array.elems;
    say %hash.keys.join(', ');
}

my @numbers = 1,2,3,4;
my %ages = Jnthn => 25, Noah => 120;
example(@numbers, %ages);