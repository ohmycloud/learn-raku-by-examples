use v6;
my $pair = 'jakub' => 'helena';  # "=>" is the pair constructor
my $pair2 = :run('quckily');     # same in adverbial notation
my $pair3 = :eat<food>;          # same using <>, the new qw()
say $pair.key;                    # returns 'jakub'
say $pair2.value ;                # returns 'quckily'
say $pair3.isa(Pair);             # Bool::True
