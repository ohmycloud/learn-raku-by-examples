# 带有常量模式的模式匹配
sub describe($x) {
    given $x {
        when 5       { "five" }
        when "hello" { "hi!" }
        when Nil     { "Empty " }
        default      { "something else" }
    }
}

say describe(5);
say describe(Nil);
say describe([1,2,3]);

sub variable_pattern($x) {
  given $x {
    when /Perl6/ { "Camelia" }
    when *       { "Star " ~ "$_" }
    default      {"something else"}
  }
}

say variable_pattern("YoungForPerl6");
say variable_pattern("Star More");
say variable_pattern("Horse");


sub generalSize($x) {
  given $x {
    when Str { .chars }
    when Map { .elems }
    default  { -1 }
  }
}

say generalSize("abc");
say generalSize(Map.new('a', 1, 'b', 2));
say generalSize(pi);

sub patternGuard($x) {
  given $x {
    when Int && ($_ > 0) { "positive" }
    when Int && ($_ < 0) { "negative" }
    default {"something else"}
  }
}

say patternGuard(2);
say patternGuard(-2);
say patternGuard("ha");

sub multiple_alternatives($x) {
  given $x {
    when '0' | '0x' | '0X' { 'multiple_alternatives' }
    default {'something else'}
  }
}

say multiple_alternatives('0x');
say multiple_alternatives('ascii');
say multiple_alternatives('0X');
say multiple_alternatives('0');

my $ch = 23;
given $ch  {
    when Int and * > 10 { say 65}
    when '+' { 1  }
    when '-' { -1 }
    default  { 0  }
}


sub variables_patterns($x) {
  given $x {
    when '+' { 1  }
    when '-' { -1 }
    when *   { $_ }
    default  {say 'something else'}
  }
}

say variables_patterns('+');
say variables_patterns([1,2,3]);
say variables_patterns('variables_patterns');

multi washing_machine(Int \x where * > 10 ) { 65 }
multi washing_machine(Str \x where '+'    ) { 1  }
multi washing_machine(Str \x where '-'    ) { -1 }
multi washing_machine(\x)                   { 0  }

say washing_machine(12);      # 65
say washing_machine(-12);     # 0
say washing_machine('+');     # 1
say washing_machine('-');     # -1
say washing_machine('2333');  # 0
say washing_machine('洗衣机'); # 0
