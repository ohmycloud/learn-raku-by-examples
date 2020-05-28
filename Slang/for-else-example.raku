use lib 'Slang';
use ForElse;

my @values;
for @values -> $value {
    say "Got $value";
}
else {
    say "No values :("
}