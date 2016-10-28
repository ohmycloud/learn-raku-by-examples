 use v6;

 my @scores = 'Ana' => 8, 'Dave' => 6, 'Charlie' => 4, 'Beth' => 4;

 my $screen-width = 30;

 my $label-area-width = 1 + [max] @scores».key».chars;
 my $max-score = [max] @scores».value;
 my $unit = ($screen-width - $label-area-width) / $max-score;
 my $format = '%- ' ~ $label-area-width ~ "s%s\n";

 for @scores {
 printf $format, .key, 'X' x ($unit * .value);
 }