subset NonEmptyString 
    of Str
    where *.chars > 0;

sub firstName(NonEmptyString $name) {
    say "your name is $name";
}

firstName('Larry');
firstName('');

