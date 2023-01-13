subset Union where Int | Rat | Str;

multi sub test(Union \x) {
    say(~x ~ " multi2")
}

multi sub test(\x where * ~~ Int | Str | Rat) {
    say(~x ~ " multi1")
}

sub MAIN() {
    test(1);
    test('str');
    test(3.1415926);
    test(pi);
}