grammar StationDataParser { 
    token TOP          { ^ <keyval>+ <observations> $             } 
    token keyval       { $<key>=[<-[=]>+] '=' \h* $<val>=[\N+] \n } 
    token observations { 'Obs:' \h* \n <observation>+             } 
    token observation  { $<year>=[\d+] \h* <temp>+ %% [\h*] \n    } 
    token temp         { '-'? \d+ \. \d+                          } 
} 

class StationData { 
    has $.name; 
    has $.country; 
    has @.data; 
     
    submethod BUILD(:%info (:Name($!name), :Country($!country), *%), :@!data) { 
    } 
} 
 
class StationDataActions { 
    method TOP($/) { 
        make StationData.new( 
            info => $<keyval>.map(*.ast).hash, 
            data => $<observations>.ast 
        ); 
    } 
	
    method keyval($/) { 
        make ~$<key> => ~$<val>; 
    } 
    method observations($/) { 
        make $<observation>.map(*.ast).grep(*.value.none <= -99); 
    } 
    method observation($/) { 
        make +$<year> => $<temp>.map(*.Num); 
    } 
} 

say StationDataParser.parse( q:to/EOCSV/, :actions(StationDataActions)).ast
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
EOCSV