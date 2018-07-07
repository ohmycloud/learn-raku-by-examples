use Digest::HMAC;
use Digest;
use Digest::SHA;
use MIME::Base64;
use URI::Encode;
use URI;
use WWW;

#  URL 编码
sub oauth_escape($s){
    return uri_encode_component($s.Str);
}

# 返回当前时间戳
sub oauth_timestamp() {
    return time;
}

# 返回一个8位的随机数
sub oauth_nonce($size=8) {
    return ((1..9).pick for 1..$size).join("");
}

# 拼接查询字符串
sub oauth_query(%args) {
    return (sprintf "%s=%s", $_, oauth_escape(~%args{$_}) for %args.keys.sort).join('&');
}

# URL 正规化
sub oauth_normalized_url($url){
    my URI $u .= new($url);
    return sprintf('%s://%s%s', $u.scheme, $u.host, $u.path);
}

# 加密算法
sub HMAC_SHA1($key_string, $base_string) {
    return MIME::Base64.encode(hmac($key_string, $base_string, &sha1));
}

## 签名值
sub oauth_signature($url, $method, %base_args) {
    my $normalized_url = oauth_normalized_url($url);
    my $query_items    = oauth_query(%base_args);
    my @base_elems     = ($method.uc, $normalized_url, $query_items);
    my $base_string    = (oauth_escape($_) for @base_elems).join("&");
    my @keys_elems     = ('1cb3cad77029aa8eb8a857468f538b10', '');
    my $keys_string    = (oauth_escape($_) for @keys_elems).join("&");
    return HMAC_SHA1($keys_string, $base_string);
}

sub oauth_header(%base_args, $realm='') {
    my $auth_header = 'OAuth realm="%s"'.sprintf($realm);
    for %base_args.keys.sort -> $key {
        if $key.starts-with('oauth_') or $key.starts-with('x_auth_') {
            $auth_header ~= ', %s="%s"'.sprintf($key, oauth_escape(%base_args{$key}));
        }
    }
    # Authorization: OAuth realm="", oauth_consumer_key="f673c5fdec13ea951797db38e2ac90d4", oauth_nonce="80888076", oauth_signature="lBE9LMlfnk2LjnK%2Flt8XJWfnmR4%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1514818785", oauth_version="1.0"
    return 'Authorization' => $auth_header;
}

my $method = 'HMAC-SHA1';
my $request_url = 'http://fanfou.com/oauth/request_token';

# get 请求时，除了签名值（oauth_signature ）之外的参数
my %base_args =  'oauth_consumer_key'     => 'f673c5fdec13ea951797db38e2ac90d4',
                 'oauth_signature_method' => 'HMAC-SHA1',
                 'oauth_timestamp'        => oauth_timestamp(),
                 'oauth_nonce'            => oauth_nonce(),
                 'oauth_version'          => '1.0';

# # 签名值
# my $oauth_signature = oauth_signature($request_url, 'GET', %base_args);
#
# %base_args ,= :$oauth_signature;
#
# my $get_url = $request_url ~ '?' ~ oauth_query(%base_args);
#
# my $headers = oauth_header(%base_args);
#
# # 获取授权 request token
# my $res = get $get_url, |$headers;

# sub access_token() {
#     # my %oauth_token = %oauth_token || $.oauth_token;
#     # my %args = do if $oauth_verifier { 'oauth_verifier' => $oauth_verifier } else { {} };
#     # my %resp = self.oauth_request($.access_token_url, 'GET', %args);
#     my %oauth_token = $res.split('&')».split('=').flat.hash;
#     return 'key' => %oauth_token{'oauth_token'}, 'secret' => %oauth_token{'oauth_token_secret'};
# }



sub request_token($url, %base_args) {
  my $oauth_signature = oauth_signature($url, 'GET', %base_args);
  %base_args ,= :$oauth_signature;
  my $get_url = $url ~ '?' ~ oauth_query(%base_args);
  my $headers = oauth_header(%base_args);
  my $res = get $get_url, |$headers; # 获取授权 request token
  my %oauth_token = $res.split('&')».split('=').flat.hash;
  return 'key' => %oauth_token{'oauth_token'}, 'secret' => %oauth_token{'oauth_token_secret'};
}

#say access_token;
my %oauth_token = request_token($request_url, %base_args);
my $callback = 'http://localhost:8080/callback';
my $authorize_url = 'http://m.fanfou.com' ~ '/oauth/authorize?oauth_token=%s&oauth_callback=%s'.sprintf(%oauth_token{'key'}, $callback );
say %oauth_token;
say $authorize_url;


my $access_token_url ='http://fanfou.com/oauth/access_token';
sub access_token($access_token_url,%base_args) {
    # my %oauth_token = %oauth_token || $.oauth_token;
    # my %args = do if $oauth_verifier { 'oauth_verifier' => $oauth_verifier } else { {} };

    my $oauth_signature = oauth_signature($access_token_url, 'GET', %base_args);
    %base_args ,= :$oauth_signature;
    my $get_url = $access_token_url ~ '?' ~ oauth_query(%base_args);
    my $headers = oauth_header(%base_args);
    my %oauth_token = request_token($access_token_url, %base_args);
    return 'key' => %oauth_token{'oauth_token'}, 'secret' => %oauth_token{'oauth_token_secret'};
}

say access_token($access_token_url,%base_args);
