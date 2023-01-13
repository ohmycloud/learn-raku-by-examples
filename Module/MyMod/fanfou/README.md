## DESCRIPTION

FanFou is a oauth client inspared by [fanfou-py](https://docs.setq.me/oh-my-robot/fanfou-api.html).  

The module provides several ways to authorize,  see [Fanfou API OAuth](https://github.com/FanfouAPI/FanFouAPIDoc/wiki/Oauth) for more details.

## Write Your Own Robot

![img](http://photo1.fanfou.com/v1/mss_3d027b52ec5a4d589e68050845611e68/ff/n0/0f/qm/xd_368058.jpg@596w_1l.jpg)

```perl6
use FanFou;
my %oauth_consumer = key => 'your_consumer_key', secret => 'your_secret_key';

# get client
my $client = FanFou::XAuth.new(oauth_consumer => %oauth_consumer, username => 'your_username', password => 'your_password');

# get response
my $resp = from-json await $client.request('/statuses/home_timeline', 'GET').body-text;
say $resp.perl;

# post a message
my %body = 'status' => "Hi, fan, I'm a robot";
$client.request('/statuses/update', 'POST', %body);
```


my %oauth_consumer = key => 'f673c5fdec13ea951797db38e2ac90d4', secret => '1cb3cad77029aa8eb8a857468f538b10';
{key => f673c5fdec13ea951797db38e2ac90d4, secret => 1cb3cad77029aa8eb8a857468f538b10}
> my $client = FanFou::OAuth.new(oauth_consumer => %oauth_consumer)
FanFou::OAuth.new(oauth_consumer => {:key("f673c5fdec13ea951797db38e2ac90d4"), :secret("1cb3cad77029aa8eb8a857468f538b10")}, oauth_token => {}, callback => "http://localhost:8080/callback", auth_host => "http://m.fanfou.com", form_urlencoded => "application/x-www-form-urlencoded", base_api_url => "http://api.fanfou.com\%s.json", access_token_url => "http://fanfou.com/oauth/access_token", request_token_url => "http://fanfou.com/oauth/request_token", authorize_url => "http://m.fanfou.com/oauth/authorize?oauth_token=\%s\&oauth_callback=\%s")

say $client.request_token
{key => 82968242fc02f4c64b677ab683fd79b1, secret => 593b94e5222f973f32b3e48c26c28722}

say $client.authorize_url
http://m.fanfou.com/oauth/authorize?oauth_token=82968242fc02f4c64b677ab683fd79b1&oauth_callback=http://localhost:8080/callback

say $client.access_token
An operation first awaited:
  in method oauth_request at /Applications/Rakudo/share/perl6/site/sources/A7576993821517143E3911FE11BAC9DAA6D485E8 (FanFou) line 101
  in method access_token at /Applications/Rakudo/share/perl6/site/sources/A7576993821517143E3911FE11BAC9DAA6D485E8 (FanFou) line 123
  in block <unit> at <unknown file> line 1

Died with the exception:
    Server responded with 401 Unauthorized
      in block  at /Applications/Rakudo/share/perl6/site/sources/99126695DF75E3226F5852E330363C9BF3B26F44 (Cro::HTTP::Client) line 418

      

## AUTHOR

ohmycloud@gmail.com

## COPYRIGHT AND LICENSE

Copyright 2018

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
