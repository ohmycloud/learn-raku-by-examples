#!/usr/bin/env raku
use v6.d;

my $text = q:to/END/;
Name= Jan Mayen
Country= NORWAY
Lat=   70.9
Long=    8.7
Height= 10
Start year= 1921
End year= 2009
Obs:
1921 -4.4 -7.1 -6.8 -4.3 -0.8  2.2  4.7  5.8  2.7 -2.0 -2.1 -4.0
1922 -0.9 -1.7 -6.2 -3.7 -1.6  2.9  4.8  6.3  2.7 -0.2 -3.8 -2.6
2008 -2.8 -2.7 -4.6 -1.8  1.1  3.3  6.1  6.9  5.8  1.2 -3.5 -0.8
2009 -2.3 -5.3 -3.2 -1.6  2.0  2.9  6.7  7.2  3.8  0.6 -0.3 -1.3
END

grammar StationDataParser {
    token TOP          { ^ <keyval>+ <observations> $             }
    rule  keyval       { $<key>=[<-[=]>+] '=' $<val>=[\N+]        }
    token observations { 'Obs:' \h* \n <observation>+             }
    token observation  { $<year>=[\d+] \h* <temp>+ %% [\h*] \n    }
    token temp         { '-'? \d+ \. \d+                          }
}

my $match = StationDataParser.parse($text);
dd $match;