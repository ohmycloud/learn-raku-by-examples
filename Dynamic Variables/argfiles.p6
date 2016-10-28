use v6;

$*ARGFILES.perl.say; #=> IO::Handle.new(:path(Any),:chomp)

# 按行读取
for $*ARGFILES.lines -> $line {
    say "$line";
}

# 一次性读取
# say $*ARGFILES.slurp;
