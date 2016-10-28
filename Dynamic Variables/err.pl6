use v6;

say $*ERR.perl;
say $*ERR.path;
say $*ERR.chomp;

$*ERR.say("我错了");
