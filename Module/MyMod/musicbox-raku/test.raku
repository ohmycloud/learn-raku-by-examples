use OpenSSL::CryptTools;
use Base64::Native;

# IV and key
my $iv = '0102030405060708'.encode;
my $key = ('xy' x 16).encode;

# Encrypt.
my $ciphertext = encrypt("hello".encode, :aes256, :$iv, :$key);
say $ciphertext;
say base64-encode($ciphertext, :str);


# Decrypt.
say decrypt($ciphertext, :aes256, :$iv, :$key).decode;