my regex insigline {
^ \s* [ <?> | '#' .* | '{' | '}' ] \s* $
}
  sub MAIN(*@files) {
      my $total = 0;
      for @files -> $filename {
           try {
           $total += lines($filename.IO).grep(
              { $_ !~~ /<&insigline>/ } ).elems;
      }
     note "can't read $filename " if $!;
   }
say $total; 
}
