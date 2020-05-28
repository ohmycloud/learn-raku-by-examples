#!/usr/bin/env perl6

shell("touch $_.adoc") for Date.new('2019-12-01') .. Date.new('2019-12-24');
shell("ls");
shell("ls -a");
run "ls";
run "ls", "-a";