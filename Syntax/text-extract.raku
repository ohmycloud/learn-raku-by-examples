# 提取文本块儿
sub MAIN(:$file) {
    my @text-blocks = gather {
        my @current;

        for $file.IO.lines {
            if "ROW  COLUMN+CELL" ^ff^ /^ \d+ \s row/ {
                # collect the values between matches
                push @current, $_;
            } else {
                # take the next value between matches
                # don't bother if there wasn't any values matched
                if @current {
                    # you must do something so that you aren't
                    # returning the same instance of the array
                    take @current.List;
                    @current = ();
                }
            }
        }
  }

  # 把文本块儿分别输出到一个文件中
  for @text-blocks -> $b {
      state $index = 0;
      my $fh = "{$index++}.txt".IO.open(:mode<wo>, :create);
      $fh.say: $_ for |$b;
      $fh.close;
  }
}