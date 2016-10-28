use v6;
 my $ingredients = 'eggs, milk, sugar and flour';

 if $ingredients ~~ m/:s ( \w+ )+ % \,'and' (\w+)/ {
 say 'list: ', $/[0].join(' | ');
 say 'end: ', "$/[1]";
 }