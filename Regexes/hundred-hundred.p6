my $str = "one,more,thing,";  # with a comma in the end
my regex word { \w+ };
say $str ~~ /<word>+ %% ','/; # the `%%` can handle both comma and absence of comma
