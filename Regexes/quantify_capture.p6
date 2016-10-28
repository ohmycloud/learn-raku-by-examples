 use v6;
 my $ingredients = 'eggs, milk, sugar and flour';

 if $ingredients ~~ m/(\w+)+ % [\,\s*] \s* 'and' \s* (\w+)/ {
 say 'list: ', $/[0].join(' | ');
 say 'end: ', "$1";
 }