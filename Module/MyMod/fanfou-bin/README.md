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

## AUTHOR

ohmycloud@gmail.com

## COPYRIGHT AND LICENSE

Copyright 2018

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
