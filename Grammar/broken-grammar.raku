# Broken, do not try
my class Rx is Regex {
    my $rx-body = ' foo \s bar ';

    has     @!input-chars;
    has Int $!pos = 0;

    method CALL-ME(Rx:U: Str() $input --> Match) {
       my $rx = self.bless: :input-chars($input.comb);
       $rx!match
    }

    method !match {
        while 0 ≤ $!pos ≤ @!input-chars.elem {
            my $c := @!input-chars[$!pos];
            if MATCHER($c, $rx-body) === PartMatch { $!pos++ }
            #  ^^^ somehow handles backtracking?
            if MATCHER($c, $rx-body) === FullMatch {
                return Match(FullMatch) }
            else { $!pos-- }
        }
        $!pos < 0 { return Match('#<failed match>') }
    }
}

# Hypothetical useage:
Rx('foo bar');