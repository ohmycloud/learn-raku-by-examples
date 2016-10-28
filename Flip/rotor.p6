use v6;

my %re;
for 'input.txt'.IO.lines».rotor(2, :partial) -> $header, $data {
    my $key = $header;
    $key ~~ s/<upper>$//;
    %re{$key} ~= $data;
}

for %re.kv -> $key, $value {
    say "$key\n$value";
}
