#! /usr/bin/env perl6
use v6;

my @records = (
    { :Name<Damian Conway>, :Age(42), :ID('00012345')  },
    { :Name<Leslie Duvall>, :Age(29), :ID('668')       },
    { :Name<Sam Georgious>, :Age(-2), :ID('00000007')  },
);

sub normalize_data (Hash $record) {
    $record<Name>  .= subst(/<lower>/,{$<lower>.uc}, :g);
    $record<Age> max= 18;
    $record<ID>    .= fmt('%08d');
}

sub report ($outcome) {
    say "\tInvalid record ($outcome)";
}


sub invalid_name ($rec) { "Bad name: $rec" if $rec<Name> !~~ /\S/;        }
sub invalid_age  ($rec) { "Bad age:  $rec" if $rec<Age>  < 18;            }
sub invalid_ID   ($rec) { "Bad ID:   $rec" if $rec<ID>   !~~ /^\d ** 8$/; }


say 'Validating...';
my @invalidations = gather for @records -> $record {
    take invalid_name($record);
    take invalid_age($record);
    take invalid_ID($record);
}

for @invalidations -> $errmsg {
    report( $errmsg );
}

say 'Normalizing...';
for @records -> $record {
    normalize_data($record);
}

say 'Revalidating...';

@invalidations = gather for @records -> $record {
    take invalid_name($record);
    take invalid_age($record);
    take invalid_ID($record);
}

for @invalidations -> $errmsg {
    report( $errmsg );
}
