role BarChart {
    has Int @.bar-values;
    has $.b is rw;
    method plot {
        say @.bar-values;
    }
}

my $chart = BarChart.new(bar-values => [1,2,3], b => "Camelia");
say $chart.b;
say $chart.bar-values;
$chart.b = "Rakuo";
say $chart.b;
say BarChart.^methods;
