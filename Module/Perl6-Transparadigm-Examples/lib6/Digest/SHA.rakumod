#! /usr/bin/env perl6
use v6;

module Digest::SHA;

constant primes = grep &is-prime, 2 .. *;

sub init(&f) {
    map { my $f = $^p.&f; (($f - $f.Int)*2**32).Int }, primes
}

sub infix:<m+> { ($^a + $^b) % 2**32 }
sub rotr($n, $b) { $n +> $b +| $n +< (32 - $b) }

multi sha256(Blob $data) is export {

    constant K = init(* **(1/3))[^64];
    my $l = 8 * my @b = $data.list;
    push @b, 0x80; push @b, 0 until (8*@b-448) %% 512;
    push @b, reverse gather for ^8 { take $l%256; $l div=256 }

    sub seed { @b.shift xx 4 }
    my @word = :256[seed()] xx @b/4;

    my @H = init(&sqrt)[^8];
    my @w;
    loop (my $i = 0; $i < @word; $i += 16) {
        my @h = @H;
        for ^64 -> $j {
            @w[$j] = $j < 16 ?? @word[$j + $i] // 0 !!
            [m+]
            rotr(@w[$j-15], 7) +^ rotr(@w[$j-15], 18) +^ @w[$j-15] +> 3,
            @w[$j-7],
            rotr(@w[$j-2], 17) +^ rotr(@w[$j-2], 19)  +^ @w[$j-2] +> 10,
            @w[$j-16];
            my $ch = @h[4] +& @h[5] +^ +^@h[4] % 2**32 +& @h[6];
            my $maj = @h[0] +& @h[2] +^ @h[0] +& @h[1] +^ @h[1] +& @h[2];
            my $s0 = [+^] map { rotr @h[0], $_ }, 2, 13, 22;
            my $s1 = [+^] map { rotr @h[4], $_ }, 6, 11, 25;
            my $t1 = [m+] @h[7], $s1, $ch, K[$j], @w[$j];
            my $t2 = $s0 m+ $maj;
            @h = $t1 m+ $t2, @h[^3], @h[3] m+ $t1, @h[4..6];
        }
        @H = @H Z[m+] @h;
    }

    return Blob.new( map -> $word is rw {
        reverse gather for ^4 { take $word % 256; $word div= 256 }
    }, @H);
}

multi sha256(Str $text) is export {
    return sha256( $text.encode() ).list.join;
}


