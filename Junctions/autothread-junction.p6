# Autothreaded junctions

# 一般逻辑
{
my @valid = <foo bar baz>;
my $what = 'ber';
say "$what is not valid" if not @valid.grep: { $what eq $_ };
say "A ber or a bar"     if $what eq 'ber' or $what eq 'bar';
}

# 自动线程化的 junctions
my @valid = <foo bar baz>;
my $what = 'ber';
say "$what is not valid" if $what eq none @valid;
say "A ber or a bar"     if $what eq 'ber' | 'bar';