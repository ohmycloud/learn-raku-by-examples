my $s = "aabbc";
with   $s.index("a") {"Found a at $_".say}
orwith $s.index("b") {"Found b at $_".say}
orwith $s.index("c") {"Found c at $_".say}
else                 {"Didn't find a, b or c".say}
