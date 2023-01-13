use Digest::HMAC;
use Digest;
use Digest::SHA;
use MIME::Base64;
use URI::Encode;
use URI;
use HTTP::UserAgent;

unit class FanFou:ver<0.0.5>;

sub oauth_escape($s)           { return uri_encode_component($s.Str) }
sub oauth_timestamp()          { return time }
sub oauth_nonce($size=8)       { return ((1..9).pick for 1..$size).join("") }
sub oauth_query(%args)         { return (sprintf "%s=%s", $_, oauth_escape(~%args{$_}) for %args.keys.sort).join('&') }
sub oauth_normalized_url($url) { my URI $u .= new($url); return sprintf('%s://%s%s', $u.scheme, $u.host, $u.path)     }

class Auth {
    has %.oauth_consumer    is rw = {};
    has %.oauth_token       is rw = {};
    has $.callback          is rw = 'http://localhost:8080/callback';
    has $.auth_host         is rw = 'http://m.fanfou.com';
    has $.form_urlencoded   is rw = 'application/x-www-form-urlencoded';
    has $.base_api_url      is rw = 'http://api.fanfou.com%s.json';
    has $.access_token_url  is rw = 'http://fanfou.com/oauth/access_token';
    has $.request_token_url is rw = 'http://fanfou.com/oauth/request_token';
    has $.authorize_url     is rw = $!auth_host ~ '/oauth/authorize?oauth_token=%s&oauth_callback=%s';

    method HMAC_SHA1($key_string, $base_string) {
        return MIME::Base64.encode(hmac($key_string, $base_string, &sha1));
    }

    method oauth_signature($url, $method, %base_args) {
        my $normalized_url = oauth_normalized_url($url);
        my $query_items    = oauth_query(%base_args);
        my @base_elems     = ($method.uc, $normalized_url, $query_items);
        my $base_string    = (oauth_escape($_) for @base_elems).join("&");
        my @keys_elems     = (%.oauth_consumer{'secret'}, %.oauth_token{'secret'} // '');
        my $keys_string    = (oauth_escape($_) for @keys_elems).join("&");
        return self.HMAC_SHA1($keys_string, $base_string);
    }

    method oauth_header(%base_args, $realm='') {
        my $auth_header = 'OAuth realm="%s"'.sprintf($realm);
        for %base_args.keys.sort -> $key {
            if $key.starts-with('oauth_') or $key.starts-with('x_auth_') {
                $auth_header ~= ', %s="%s"'.sprintf($key, oauth_escape(%base_args{$key}));
            }
        }
        return {'Authorization' => $auth_header};
    }

    method oauth_request($url is copy, $method='GET', %args={}, %headers={}) {
        my %base_args =  'oauth_consumer_key'     => %!oauth_consumer{'key'},
                         'oauth_signature_method' => 'HMAC-SHA1',
                         'oauth_timestamp'        => oauth_timestamp(),
                         'oauth_nonce'            => oauth_nonce(),
                         'oauth_version'          => '1.0';

        %args = %args.clone;
        %headers = %headers.clone;
        %headers{'User-Agent'} = %headers{'User-Agent'} // 'Cro';

        if $url.starts-with('/') {
           if $url.contains(':') {
                 my ($path,$) = $url.split(':');
                 if %args{'id'} {
                     $url = $path ~ oauth_escape(%args{'id'});
                 } else {
                     $url = $path.chop;
                 }
           }
           $url = $!base_api_url.sprintf($url);
        }

        if $method eq 'POST' {
            %headers{'content-type'} = %headers{'content-type'} // self.form_urlencoded;
            (%headers{'content-type'} eq self.form_urlencoded) and (%base_args ,= %args);
        } else {
            %base_args ,= %args;
            $url = $url ~ '?' ~ oauth_query(%args);
        }

        self.oauth_token and %base_args ,= {'oauth_token' => self.oauth_token{'key'}};
        %base_args{'oauth_signature'} = self.oauth_signature($url, $method, %base_args);
        %headers ,= self.oauth_header(%base_args);

        my $resp;
        my $data = "";
        if (%headers{'content-type'} // '') eq self.form_urlencoded {
            $data = oauth_query(%args);
        } elsif (%headers{'content-type'} // '').contains('multipart/form-data') { # multipart/form-data
            $data = %args{'form-data'};
        } else { # GET
            $data = "";
        }

        #my $client = Cro::HTTP::Client.new( headers => |%headers );
        my $ua = HTTP::UserAgent.new;
        if $data {
            try {
              $resp = $ua.post($url, %args , bin => False, |%headers);
              CATCH {
                 default {
                     say '', .^name, ': ',.Str;
                }
             }
            }
            
        } else {
            $resp = $ua.get($url, bin => False, |%headers);
        }
        say $resp;
        return $resp;
    }
}

class OAuth is Auth {
    method request($url, $method='GET', %args={}, %headers={}) {
        return self.oauth_request($url, $method, %args, %headers);
    }

    method request_token() {
        my $resp = self.oauth_request(self.request_token_url, 'GET');
        my %oauth_token = $resp.content.split('&')».split('=').flat.hash;
        self.authorize_url = self.authorize_url.sprintf(%oauth_token{'oauth_token'}, self.callback);
        self.oauth_token = 'key' => %oauth_token{'oauth_token'}, 'secret' => %oauth_token{'oauth_token_secret'};
        return self.oauth_token;
    }

    method access_token(%oauth_token={},$oauth_verifier=Nil) {
        self.oauth_token = %oauth_token or self.oauth_token;
        my %args = do if $oauth_verifier { 'oauth_verifier' => $oauth_verifier } else { {} };
        my $resp = self.oauth_request(self.access_token_url, 'GET', %args);
        %oauth_token = $resp.content.split('&')».split('=').flat.hash;
        self.oauth_token = 'key' => %oauth_token{'oauth_token'}, 'secret' => %oauth_token{'oauth_token_secret'};
        return self.oauth_token;
    }
}

class XAuth is Auth {
    has $.username is rw;
    has $.password is rw;
    has %.oauth_token is rw = self.xauth();

    method request($url, $method='GET', %args={}, %headers={}) {
        return self.oauth_request($url, $method, %args, %headers);
    }

    method xauth() {
        my %args =  'x_auth_username' => $!username,
                    'x_auth_password' => $!password,
                    'x_auth_mode'     => 'client_auth';

        my $resp = self.oauth_request(self.access_token_url, 'GET', %args);
        my %oauth_token = $resp.content.split('&')».split('=').flat.hash;
        return {'key' => %oauth_token{'oauth_token'}, 'secret' => %oauth_token{'oauth_token_secret'}};
    }

    method access_token() {
        return self.oauth_token;
    }
}

=begin pod

https://github.com/FanfouAPI/FanFouAPIDoc/wiki/Oauth

=head1 NAME

FanFou - Perl 6 oauth client for fanfou.com.

=head1 SYNOPSIS

  use FanFou;

  my %oauth_consumer = key => 'your_consumer_key', secret => 'your_secret_key';

  # get fanfou client
  my $client = FanFou::XAuth.new(oauth_consumer => %oauth_consumer, username => 'your_username', password => 'your_password');

  # get response
  my $resp = from-json $client.request('/statuses/home_timeline', 'GET').body-text;
  say $resp.perl;

  # post a message
  my %body = 'status' => 'Hi, fan, I'm a robot';
  $client.request('/statuses/update', 'POST', %body);

=head1 DESCRIPTION

FanFou is oauth client for http://fanfou.com

=head1 AUTHOR

 <ohmycloud>

=head1 COPYRIGHT AND LICENSE

Copyright 2018

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
