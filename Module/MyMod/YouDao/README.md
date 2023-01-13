NAME
====

YouDao - Translation

SYNOPSIS
========

```perl6
use YouDao;

sub MAIN($q) {
    constant APP_KEY = 'xxxxxxxx';
    constant APP_SECRET = 'xxxxxxxx';
    my $resp = YouDao::Translate.new(appkey => APP_KEY, appsecret => APP_SECRET, q => $q);
    say await $resp.request.body-text();
}
```

DESCRIPTION
===========

YouDao is used for translate  English to Chinese.

AUTHOR
======

    <ohmycloud@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2019 

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

