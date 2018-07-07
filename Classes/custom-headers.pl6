#!/usr/bin/env perl6

use v6;

class HTTP::Header does Associative {
    has %!fields handles <iterator list kv keys values>;

    sub normalize-key ($key)   { $key.subst(/\w+/, *.tc, :g)         }
    method EXISTS-KEY ($key)   { %!fields{normalize-key $key}:exists }
    method DELETE-KEY ($key)   { %!fields{normalize-key $key}:delete }
    method push (*@_)          { %!fields.push: @_                   }


    multi method AT-KEY (::?CLASS:D: $key) is rw {
        my $element := %!fields{normalize-key $key};

        Proxy.new(
            FETCH => method () { $element },

            STORE => method ($value) {
                $element = do given $value».split(/',' \s+/).flat {
                    when 1  { .[0] }    # a single value is stored as a string
                    default { .Array }  # multiple values are stored as an array
                }
            }
        );
    }
}

my $header = HTTP::Header.new;
say $header.WHAT;  #-> (Header)

$header<Accept> = "text/plain";
$header{'Accept-' X~ <Charset Encoding Language>} = <utf-8 gzip en>;
$header{'Accept-Language'} = "en, fr,    cz";

say $header<Accept-Language>.perl;          #-> ["en", "fr", "cz"] ?? 
