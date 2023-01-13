use Crypt::Random;
use experimental :pack;

# Buf of $len random bytes
my $len = 16;
my Buf $baz = crypt_random_buf($len);
say $baz.unpack("H*");

use OrderedHash;

my %oh1 does OrderedHash = 'x' => 2, c => 3, a => 1;

say %oh1.keys;                                      # (a b c)
say %oh1.values;                                    # (1 2 3)
say %oh1.kv;                                        # (a 1 b 2 c 3)
say %oh1.pairs;                                     # (a => 1 b => 2 c => 3)