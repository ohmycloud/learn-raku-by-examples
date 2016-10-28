use v6;
my $file = open 'flip_flop.txt';
for $file.lines -> $line {
say $line if !($line ~~ m/^\;/ ff $line ~~ m/^\"/);
}

#`(
flip_flop.txt 内容如下：
; next is some lines to skip,include this line
fuck fuck fuck
dam dam dam
mie mie mie
" next is subject
There is more than one way to do it
                                -- Larry Wall
								
We hope Perl6 is wrote by the hole Socfilia
                                -- Larry Wall
; next is some lines to skip,include this line
fuck fuck fuck
dam dam dam
mie mie mie
" next is subject
programming is hard,Let's go shopping
                               -- Larry Wall
Ruby is Another Perl6
                               -- Larry Wall
输出：
There is more than one way to do it
                                -- Larry Wall
We hope Perl6 is wrote by the hole Socfilia
                                -- Larry Wall
programming is hard,Let's go shopping
                               -- Larry Wall
Ruby is Another Perl6
                               -- Larry Wall
圣诞节中的例子：

)
for 1..20 {.say if $_==9 ff $_==16}
say '-' x 10;
for 1..20 {.say if $_==9 ^ff $_==16}
say '-' x 10;
for 1..20 {.say if $_==9 ff^ $_==16}
say '-' x 10;
for 1..20 {.say if $_==9 ^ff^ $_==16}

