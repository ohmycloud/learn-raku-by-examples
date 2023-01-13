## NAME

SnowFlake - A tool for generating unique ID numbers.

## SYNOPSIS

```raku
use SnowFlake;

my $worker = SnowFlake.new(worker_id => 1, sequence => 2);
say $worker.get_id();
```

## DESCRIPTION

SnowFlake is a tool for generating unique ID numbers.

## LICENSE

[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)

## AUTHORS

- <ohmycloudy@gmail.com>

