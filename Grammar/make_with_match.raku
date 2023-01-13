#!/usr/bin/env raku
use v6.d;

if 'abc' ~~ /\w/ {
    dd $/;
    $/.make({'a' => 'bc'});
    #make {'棱镜乐队' => '岛屿'};
    make [1,2,3];
    say $/.made.WHAT;      # Output: {a => bc}
    say $/.ast;       # The same as .made
    dd $/;            # Match $/ = Match.new(:orig("abc"), :from(0), :pos(1), :made({:棱镜乐队("岛屿")}))
}