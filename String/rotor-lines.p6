my @ts = "ts.csv".IO.lines;

.say for @ts.sort;

#.say if (.max - .min) >= 15 * 60 * 1000 for @ts.sort.rotor(2 => -1);