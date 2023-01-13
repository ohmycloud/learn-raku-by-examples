#| 前置的点号抑制捕获
#| https://stackoverflow.com/questions/58158010/difference-in-capturing-and-non-capturing-regex-scope-in-perl-6-raku
#| 但是在正则表达式中似乎不成功:
my regex number { \d+ }
my regex separator {
    | '|'
    | '-'
    | '.'
    | '_'
}

my token sep { '|' | '-' | '.' | '_' | <.alpha> }

for $=finish.lines {
    if m/ (<number>) <&sep> (<number>) / -> ($m, $n) {
        #say "$m, $n";
        say [+] +$m, +$n;
    }
}

=finish
12|34
56-78
90.91
1000_2047
1001w2049
1003s2051