for $=finish.lines -> $line {
    say $line if !($line ~~ m/^\;/ ff $line ~~ m/^\"/);
}

# `$line ~~ m/^\;/ ff $line ~~ m/^\"/` 过滤掉 `;` 和 `"` 之间的内容, 再对它进行取反操作就是过滤后剩下的文本。


=finish
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
Programming is hard,Let's go shopping
                               -- Larry Wall
Ruby is Another Perl6
                               -- Larry Wall
