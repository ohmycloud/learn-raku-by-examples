my $bh = BagHash.new;
for $=finish.lines {
    if m/^ (\w+) \s+ (\w+) / -> ($name, $bool) {
        $bh.add(~$name => ~$bool) if ~$bool eq '是';
    }
}

for $bh.kv -> $k, $v {
    say "$k.key() = $v";
}

=finish
张三    是    0.12
李四    是   0.15
张三    否   0.13
张三    是   0.11
李四    是   0.11
李四    否   0.19
张三    是    0.12

