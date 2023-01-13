my $commands = Channel.new;
my $input = Supplier.new;
my $output = Supplier.new;
my $quit = Promise.new;
react {
    print '> ';

    start loop { $input.emit: $*IN.getc }

    whenever $input.Supply.lines.map({ .trim }) {
        when /^add \s+ (\d+) \s+ (\d+)$/ { $commands.send: ('add', +$0, +$1) }
        when /^sub \s+ (\d+) \s+ (\d+)$/ { $commands.send: ('sub', +$0, +$1) }
        when 'quit' | 'exit' { $quit.keep }
        default { $output.emit: 'syntax error' }
    }

    whenever $commands -> @command {
        multi doit('add', Int $a, Int $b) { $a + $b }
        multi doit('sub', Int $a, Int $b) { $a - $b }

        $output.emit: doit(|@command);
    }

    whenever $output.Supply { .say; print '> ' }

    whenever $quit {
        say 'Quitting.';
        done;
    }
}