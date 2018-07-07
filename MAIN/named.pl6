use v6;

sub MAIN(:$source, :$target, :$count, :$debug) {
    say "source: $source" if $source.defined;
    say "target: $target" if $target.defined;
    say "count:  $count"  if $count.defined;
    say "debug:  $debug"  if $debug.defined;
}

