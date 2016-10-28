#! /usr/bin/env perl6
use v6;

say .list».fmt("%02x").join given sha256 "Perl 6 is awesome";

sub sha256(Str $text --> Blob) {

    # Create modular-addition and bit-rotate-right operators
    sub infix:«mod+» ($a, $b)     { ($a + $b) % 2**32 }
    sub infix:«rot>» ($bits, $n)  { $n +> $bits +| $n +< (32 - $bits) }

    # Map a function g() of f() over an infinite list of primes
    sub init(&f) {
        constant primes = grep &is-prime, 2 .. *;
        map { my $f = $^p.&f; (($f - $f.Int)*2**32).Int },
            primes
    }
    constant K = init( { $^n ** (1/3) })[^8];

    # Convert the input text to a Big List Of Bytes
    my Blob $data = $text.encode();
    my @b = $data.list;

    # Remember the byte-count
    my $l = 8 * @b.elems;

    # Extend the byte list to the appropriate width, adding salt
    push @b, 0x80; push @b, 0 until (8*@b-448) %% 512;
    push @b, reverse gather for ^8 { take $l%256; $l div=256 }

    # Create an initial hash string (in base-256)
    my @word = :256[@b.shift xx 4] xx @b/4;

    # Create an initial seed fro the first eight primes
    my @H = init(&sqrt)[^8];
    my @w;

    # Repeatedly "mess up" the hash string with complex bit operations
    loop (my $i = 0; $i < @word; $i += 16) {
       my @h = @H;
       for ^64 -> $j {
          @w[$j] = $j < 16
              ??  @word[$j + $i] // 0
              !!  [mod+] (@w[$j-15] rot> 7) +^ (@w[$j-15] rot> 18)
                         +^ @w[$j-15] +> 3,
                  @w[$j-7],
                  (@w[$j-2] rot> 17) +^ (@w[$j-2] rot> 19)
                         +^ @w[$j-2] +> 10,
                  @w[$j-16];

          my $ch  = @h[4] +& @h[5] +^ +^@h[4] % 2**32 +& @h[6];
          my $maj = @h[0] +& @h[2] +^ @h[0] +& @h[1] +^ @h[1] +& @h[2];
          my $S0  = [+^] map { @h[0] rot> $^n }, 2, 13, 22;
          my $S1  = [+^] map { @h[4] rot> $^n }, 6, 11, 25;
          my $t1  = [mod+] @h[7], $S1, $ch, K[$j], @w[$j];
          my $t2  = $S0 mod+ $maj;

          @h      = $t1 mod+ $t2, @h[^3], @h[3] mod+ $t1, @h[4..6];
       }

       @H = @H Z[mod+] @h;
    }

    # Convert the hash string back to a list of 8-bit bytes
    return Blob.new: map -> $word is rw {
        reverse gather for ^4 { take $word % 256; $word div= 256 }
    }, @H;
}


