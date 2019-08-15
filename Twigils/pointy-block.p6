my @fave_foods = <hanbao pingguo TV>;
for @fave_foods -> $food {
    say "Jonathan likes to eat $food";
}
# The bit between the curly braces is done for each thing in the array
# -> $name means “declare $name and put the current thing into it”

# $^identifier 变量用于块中:

my @str = <a very long but shorthand really>;
my @sorted = sort { $^a.chars <=> $^b.chars}, @str;
say @sorted;

# sort 可以更简洁
my @s = sort { .chars }, @str;
say @s;

my $block = {
    $^a + $^b;
};
say $block(1,99);
