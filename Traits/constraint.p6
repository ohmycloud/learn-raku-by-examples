sub add (Int $inputA, Int $inputB --> Int)
{
    my $result = $inputA+$inputB;

    say $result;         # Oops, this is the last statement, so its return value is used for the subroutine
}

# my $sum = add(5,6);
# Type check failed for return value; expected 'Int' but got 'Bool'

sub add2 (Int $inputA, Int $inputB --> Int)
{
    my $result = $inputA+$inputB;

    return $result;
}

my $sum2 = add2(5,6);
say $sum2;

sub add3 (Int $inputA, Int $inputB) returns Int
{
    my $result = $inputA+$inputB;

    return $result;
}

my $sum3 = add3(5,6);
say $sum3;
