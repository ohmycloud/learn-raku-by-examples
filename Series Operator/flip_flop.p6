use v6;

my $file = open 'flip_flop.txt';
for $file.lines -> $line {
    say $line if !($line ~~ m/^\;/ ff $line ~~ m/^\"/);
}

# for 1..20 {.say if $_==9 ff $_==16}
# say '-' x 10;
# for 1..20 {.say if $_==9 ^ff $_==16}
# say '-' x 10;
# for 1..20 {.say if $_==9 ff^ $_==16}
# say '-' x 10;
# for 1..20 {.say if $_==9 ^ff^ $_==16}
