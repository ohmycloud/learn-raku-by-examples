#| https://adventofcode.com/2022/day/2

my @shapes = 'Rock', 'Paper', 'Scissors';
my @scores = 1, 2, 3;
my %score = @shapes Z=> @scores;
my @chosen = gather for $=finish.lines -> $pair {
    take $pair.split(/\s/)
}

my @score = gather for @chosen.pick(3) -> ($opponent, $myself) {
    say $opponent, " ", $myself;
    take round($opponent, $myself);
}

say [+] @score;

multi sub round('Rock', 'Paper') {
    return 6 + %score{'Paper'}
}

multi sub round('Rock', 'Rock') {
    return 3 + %score{'Rock'}
}

multi sub round('Rock', 'Scissors') {
    return 0 + %score{'Scissors'}
}

multi sub round('Paper', 'Paper') {
    return 3 + %score{'Paper'}
}

multi sub round('Paper', 'Rock') {
    return 0 + %score{'Rock'}
}

multi sub round('Paper', 'Scissors') {
    return 6 + %score{'Scissors'}
}

multi sub round('Scissors', 'Paper') {
    return 0 + %score{'Paper'}
}

multi sub round('Scissors', 'Rock') {
    return 6 + %score{'Rock'}
}

multi sub round('Scissors', 'Scissors') {
    return 3 + %score{'Scissors'}
}

=finish
Rock Rock
Rock Paper
Rock Scissors
Paper Rock
Paper Paper
Paper Scissors
Scissors Rock
Scissors Paper
Scissors Scissors