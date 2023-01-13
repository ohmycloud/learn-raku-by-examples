# I want to extract the row key(here is `28_2820201112122420516_000000`), the column name(here is `bcp_startSoc`), and the value(here is `64.0`) in `$str`, where `$str` is a row from HBase: 

# `match` is OK
my $str = '28_2820201112122420516_000000 column=d:bcp_startSoc, timestamp=1605155065124, value=64.0';
my $match = $str.match(/^ ([\d+]+ % '_') \s 'column=d:' (\w+) ',' \s timestamp '=' \d+ ',' \s 'value=' (<-[=]>+) $/);
my @match-result = $match».Str.Slip;
say @match-result;   # Output: [28_2820201112122420516_000000 bcp_startSoc 64.0]

# `smartmatch` is OK
# $str ~~ /^ ([\d+]+ % '_') \s 'column=d:' (\w+) ',' \s timestamp '=' \d+ ',' \s 'value=' (<-[=]>+) $/
# say $/».Str.Array; # Output: [28_2820201112122420516_000000 bcp_startSoc 64.0]

# `comb` is NOT OK
# A <( token indicates the start of the match's overall capture, while the corresponding )> token indicates its endpoint. 
# The <( is similar to other languages \K to discard any matches found before the \K.
my @comb-result = $str.comb(/<( [\d+]+ % '_' )> \s 'column=d:' <(\w+)> ',' \s timestamp '=' \d+ ',' \s 'value=' <(<-[=]>+)>/);
say @comb-result;    # Expect: [28_2820201112122420516_000000 bcp_startSoc 64.0], but got [64.0]

# use lookbehind assertion
say $str.comb(/ ^ [\d+]+ % '_' | <?after value'='> .* | <?after 'd:'> \w+/);