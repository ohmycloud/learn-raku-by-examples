#!/usr/bin/env perl6

use Pretty::Table;

my $table = Pretty::Table.new:
        title => "Australian Cities",
        field-names => ["City name", "Area", "Population", "Annual Rainfall"],
        sort-by => 'Area',
        align => %('City name' => 'l'),
        ;

given $table {
    .add-row: ["Adelaide",  1295,  1158259,  600.5 ];
    .add-row: ["Brisbane",  5905,  1857594,  1146.4];
    .add-row: ["Darwin",    112,   120900,   1714.7];
    .add-row: ["Hobart",    1357,  205556,   619.5 ];
    .add-row: ["Sydney",    2058,  4336374,  1214.8];
    .add-row: ["Melbourne", 1566,  3806092,  646.9 ];
    .add-row: ["Perth",     5386,  1554769,  869.4 ];
}

say $table;