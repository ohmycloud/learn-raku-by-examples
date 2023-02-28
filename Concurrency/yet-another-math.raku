use Terminal::Print <T>;

sub chinese-character() {
    my @characters = gather for 1..0x10FFFD {
        my $char = $_.chr;
        take $char if $char ~~ /<:Han>/;
    }
}

#| 左下角
sub left-bottom(@lines) {
    T.initialize-screen;
    my $init-column = 1;

    for @lines -> $line {
        my @words = $line.comb;
        my $row = 26;
        state $column = 1;

        for @words -> $word {
            T.print-cell($column, $row, $word);
            $row -= 1;
            $column += 1;
            sleep 0.02;
        }
        $column = ($init-column += 4);
    }

    T.shutdown-screen;
}

#| 左上角
sub left-top(@lines) {
    T.initialize-screen;
    my $init-column = 1;

    for @lines -> $line {
        my @words = $line.comb;
        my $row = 0;
        state $column = 1;

        for @words -> $word {
            T.print-cell($column, $row, $word);
            $row += 1;
            $column += 1;
            sleep 0.02;
        }
        $column = ($init-column += 4);
    }

    T.shutdown-screen;
}

#| 右下角
sub right-bottom(@lines) {
    T.initialize-screen;
    my $init-column = 125;

    for @lines -> $line {
        my @words = $line.comb;
        my $row = 25;
        state $column = 125;

        for @words -> $word {
            T.print-cell($column, $row, $word);
            $row -= 1;
            $column -= 1;
            sleep 0.02;
        }
        $column = ($init-column -= 4);
    }

    T.shutdown-screen;
}

#| 右上角
sub right-top(@lines) {
    T.initialize-screen;
    my $init-column = 125;

    for @lines -> $line {
        my @words = $line.comb;
        my $row = 0;
        state $column = 140;

        for @words -> $word {
            T.print-cell($column, $row, $word);
            $row += 1;
            $column -= 1;
            #sleep 0.02;
            await Promise.in(0.02);
        }
        $column = ($init-column -= 4);
    }

    T.shutdown-screen;
}

sub MAIN(:$x is copy, :$y is copy) {
    #my @lines := chinese-character()[0..1056].rotor(20)>>.join('');
    my @lines := ('一' .. '二').rotor(20)>>.join('');
    #left-bottom(@lines);
    #left-top(@lines);
    #right-bottom(@lines);
    right-top(@lines);
}