use Digest::SHA256::Native;

say sha256-hex("The quick brown fox jumps over the lazy dog");
say sha256-hex("The quick brown fox jumps over the lazy dog".encode);
say sha256("The quick brown fox jumps over the lazy dog")».fmt('%02x').join;