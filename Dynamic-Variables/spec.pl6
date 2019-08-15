use v6;

say $*SPEC;          #=> (Unix)
say $*SPEC.perl;     #=> IO::Spec::Unix
say $*SPEC.path;     #=> (/usr/local/Cellar/rakudo-star/2015.12/share/perl6/site/bin /usr/local/sbin /usr/local/bin /usr/bin /bin /usr/sbin /sbin)
say $*SPEC.tmpdir;   #=> "/var/folders/9v/wr31l2zj78x1nw58jgljq_9w0000gn/T".IO
say $*SPEC.dir-sep;  #=> /
say $*SPEC.curdir;   #=> .
say $*SPEC.updir;    #=> ..
say $*SPEC.curupdir; #=> none(., ..)
say $*SPEC.rootdir;  #=> /
say $*SPEC.devnull;  #=> /dev/null
