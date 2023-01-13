## NAME

Notify - minimal notifying tool for Raku.

## SYNOPSIS

```raku
use Notify;
my $notify = Notify.new(:title('Take a break'), :msg('You\'ve been working for 45 minutes'), :msg-type('info'));
$notify.notify();
```

## DESCRIPTION

Notify is a notifying tool for Raku.

## LICENSE

[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)

## AUTHORS

- <ohmycloudy@gmail.com>