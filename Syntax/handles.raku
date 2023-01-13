
use v6;

class HTTPHeader { ... }

class HTTPHeader does Associative  {
    
    has %!fields  handles <list kv keys values>;
    method Str { say self.hash.fmt; }
    
    
    method EXISTS-KEY ($key)       { %!fields{normalize-key $key}:exists }
    method DELETE-KEY ($key)       { %!fields{normalize-key $key}:delete }
    method push (*@_)              { %!fields.push: @_                   }

    sub normalize-key ($key) { $key.subst(/\w+/, *.tc, :g) } # titileCase 驼峰式的键

    method AT-KEY (::?CLASS:D: $key) is rw {
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


my $header = HTTPHeader.new;
say $header.WHAT;  #-> (HTTPHeader)
"".say;

$header<Accept> = "text/plain";
$header{'Accept-' X~ <Charset Encoding Language>} = <utf-8 gzip en>;
$header.push('Accept-Language' => "fr");  # like .push on a Hash

say $header.hash.fmt;
"".say;
# say $header.Str; # 同上

say $header<Accept-Language>.values; 
say $header<Accept-Charset>;