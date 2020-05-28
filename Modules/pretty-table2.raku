#!/usr/bin/env perl6


sub MAIN() {
    use Pretty::Table;

    my $table = Pretty::Table.new;

    given $table {
        .add-column('Planet', ['Earth', 'Mercury', 'Venus', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune']);
        .add-column('Position', [3, 1, 2, 4, 5, 6, 7, 8])
                .add-column('Known Satellites', [1, 0, 0, 2, 79, 82, 27, 14]);
        .add-column('Orbital period (days)', [365.256, 87.969, 224.701, 686.971, 4332.59, 10_759.22, 30_688.5, 60_182.0]);
        .add-column('Surface gravity (m/s)', [9.806, 3.7, 8.87, 3.721, 24.79, 10.44, 8.69, 11.15]);
    }

    $table.title('Planets in the Solar System');
    $table.align(%(:Planet<c>));
    $table.float-format(%('Orbital period (days)' => '-10.3f', 'Surface gravity (m/s)' => '-5.3f'));
    $table.sort-by('Position');
    $table.junction-char('%');

    put $table;
}
