use Terminal::Spinners;

sub MAIN() {
    my $classic = Spinner.new: type => 'classic';
    my $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $classic.next; # prints the next spinner frame
    }

    say '';

    my $bounce = Spinner.new: type => 'bounce';
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $bounce.next; # prints the next spinner frame
    }

    say '';

    my $bounce2 = Spinner.new: type => 'bounce2';
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $bounce2.next; # prints the next spinner frame
    }

    say '';

    my $dots = Spinner.new: type => 'dots';
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $dots.next; # prints the next spinner frame
    }

    say '';

    my $dots2 = Spinner.new: type => 'dots2';
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $dots2.next; # prints the next spinner frame
    }

    say '';

    my $dots3 = Spinner.new: type => 'dots3';
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $dots3.next; # prints the next spinner frame
    }

    say '';

    my $three-dots = Spinner.new: type => 'three-dots', speed => 0.2;
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $three-dots.next; # prints the next spinner frame
    }

    say '';

    my $three-dots2 = Spinner.new: type => 'three-dots2', speed => 0.1;
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $three-dots2.next; # prints the next spinner frame
    }

    say '';

    my $bar = Spinner.new: type => 'bar';
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $bar.next; # prints the next spinner frame
    }

    say '';

    my $bar2 = Spinner.new: type => 'bar2';
    $promise = start sleep 2; # promise of your long running process
    until $promise.status {
        $bar2.next; # prints the next spinner frame
    }

    say '';

    my $hash-bar = Bar.new; # defaults to the apt-get style hash bar
    $hash-bar.show: 0; # print a 0% progress bar
    for 1 .. 3000 {
        my $percent = $_ / 3000 * 100; # calculate a percentage
        sleep 0.0002; # do iterative work here
        $hash-bar.show: $percent; # print the progress bar and percent
    }

    say '';

    my $equals-bar = Bar.new: type => 'equals',
                              length => 50; # choose the equals type with custom length
    $equals-bar.show: 0; # print a 0% progress bar
    for 1 .. 3000 {
        my $percent = $_ / 3000 * 100; # calculate a percentage
        sleep 0.0002; # do iterative work here
        $equals-bar.show: $percent; # print the progress bar and percent
    }

    say '';
}