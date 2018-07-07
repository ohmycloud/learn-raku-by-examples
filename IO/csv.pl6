use v6;

use JSON::Fast;

sub MAIN(*@files) {

    for @files -> $file {
      my %h;
      my $io = open $file ~ ".csv", :w; # 写入文件
      my $csv = Text::CSV.new(eol => "\n");
      for $file.IO.lines -> $line {
        my $x = from-json $line;
        %h{$x{'coupon_title'}}++;
      }

      my @t;
      for %h.kv -> $k, $v {
        @t.append: $k ~ ';' ~ $v;
      }
      $csv.print($io, @t) or die "Cannot print ()\n";
      $io.close;
    }
}
