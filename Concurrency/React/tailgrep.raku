#!/usr/bin/env perl6

#| https://blog.matatu.org/tailgrep
use JSON::Fast;
use Terminal::ANSIColor;

my @frames = < / - | - \ - >;
sub spinner {
    @frames[$++ % +@frames];
}

sub download-spinners {
    my $store = "{ %*ENV<HOME> }/.spinners.json";
    unless $store.IO.e {
        say "downloading spinners";
        my $url='https://raw.githubusercontent.com'
                ~ '/sindresorhus/cli-spinners'
                ~ '/HEAD/spinners.json';
        shell "curl -s $url > $store";
    }
    from-json( $store.IO.slurp );
}

multi MAIN(
        Bool :$list-spinners!, #= list spinners
           ) {
    say download-spinners.keys.sort.join("\t");
}

multi MAIN(
        $expr,                   #= what to search for
        $filename where *.IO.e,  #= a filename to grep
        Numeric :$wait = 2,      #= when to notify
        :$spinner is copy,       #= which spinner
           ) {
    my $spinners = download-spinners;
    $spinner = $spinners.keys.pick unless $spinner;
    @frames = $spinners{ $spinner }<frames><>;
    exit MAIN(:list-spinners) unless @frames;

    shell 'tput civis'; # make the cursor invisible
    my $proc = Proc::Async.new(<tail -f -->, $filename);
    my $out = $proc.stdout;
    my $last-seen = DateTime.now;
    start react {
        whenever $out.lines.grep( / "$expr" / ) {
            .say
        }
        whenever $out.lines {
            print " " ~ spinner() ~ "\r";
            $last-seen = DateTime.now;
        }
        whenever Supply.interval(1) {
            if DateTime.now - $last-seen > $wait {
                say color('red')
                        ~ "--$wait seconds, no lines--"
                        ~ color('reset');
            }
        }
        whenever signal(SIGINT) {
            shell 'tput cnorm'; # make the cursor visible
            exit;
        }
    }
    await $proc.start;
}