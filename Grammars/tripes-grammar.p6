#use Grammar::Debugger;
#use Grammar::Tracer;

grammar SalesExport {
    token TOP { ^ <country>+ $ }
    token country {
        <name> \n
        <destination>+
    }
    token destination {
        \s+ <name> \s+ ':' \s+
        <lat=.num> ',' <long=.num> \s+ ':' \s+
        <sales=.integer> \n
    }
    token name    { \w+ [ \s \w+ ]*   }
    token num     { '-'? \d+ [\.\d+]? }
    token integer { '-'? \d+          }
}


# Now we can turn any file in this format into a data structure.
#  tripes.txt 最后一行要有一个空行
my $parsed = SalesExport.parsefile('tripes.txt');

if $parsed {
    my @countries = @($parsed<country>);
	#for @countries -> $country { say ~$country<name>};
	for @countries { say [+] .<destination>»<sales>;}
}

if $parsed {
    my @countries = @($parsed<country>);
    my $top1 = @countries.max({
       [+] .<destination>»<sales> 
       });
    say "Most popular today: $top1<name> ", [+] $top1<destination>>><sales>;
}
else {
    die "Parse error!";
}
