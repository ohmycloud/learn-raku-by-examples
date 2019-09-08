use Digest::SHA256::Native;

my @base-table = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
    't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
    'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4',
    '5', '6', '7', '8', '9', '!', '#', '$', '%', '&', '(', ')', '*', '+', ',', '-', '.', '/', ':',
    ';', '<', '=', '>', '?', '@', '[', ']', '^', '_', '`', '{', '|', '}', '~'];

sub guid-for(*@values) {
    my Str $hash-str = @values.join('__');

    my @hash-bytes = sha256($hash-str.encode).subbuf(0,8).list;
    my $hash-int = 0;
    for @hash-bytes -> $b {
        $hash-int +<= 8;
        $hash-int += $b;
    }

    # convert to the weird base91 format that Anki uses
    my @rv_reversed;
    while $hash-int > 0 {
        @rv_reversed.append(@base-table[$hash-int % @base-table.elems]);
        $hash-int div= @base-table.elems;
    }
    return @rv_reversed.reverse.join('');
}