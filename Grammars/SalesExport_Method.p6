#use Grammar::Debugger;
#use Grammar::Tracer;

grammar SalesExport::Grammar {
    token TOP { ^ <country>+ $ }
    token country {
        <cname=.name> \n
        <destination>+
    }
	
    token destination {
        \s+ <dname=.name> \s+ ':' \s+
        <lat=.num> ',' <long=.num> \s+ ':' \s+
        <sales=.integer> \n
    }
	
    token name    { \w+          }
    token num     { \d+ [\.\d+]? }
    token integer { \d+          }
}

my $string = q:to/THE END/;
Norway
    Oslo : 59.914289,10.738739 : 2
    Bergen : 60.388533,5.331856 : 4
Ukraine
    Kiev : 50.456001,30.50384 : 3
Switzerland
    Wengen : 46.608265,7.922065 : 3
THE END

class SalesExport::Grammar::Actions {
	method destination($/) { make ~$<dname> => [$<sales>.map(*.Num+10),$<lat>.map(*.Num+90) ]         }
    method country($/)     { make ~$<cname> => $<destination>>>.made            }
    method TOP($/)         { make $<country>>>.made                             }
}

my $actions = SalesExport::Grammar::Actions.new;
my $grammar_action = SalesExport::Grammar.parse($string, :actions($actions)).made;
#say $grammar_action.Str;
# 获取所有国家的名字
for @$grammar_action -> $p {
    say "$p.key()";
}
say '-' x 45;
# 获取所有目的地
for @$grammar_action -> $p {
    for $p.value() -> $d {
	    for @$d -> $n {
		    say $n.key();
		}
	}
}
say '-' x 45;
# 获取出售的票数
for @$grammar_action -> $p {
    print "$p.key()\t";
    for $p.value() -> $d {
	    my $count;
	    for @$d -> $n {
		    $count += $n.value()[0];
		}
	say $count;
	}
}

say '-' x 45;
# 获取经度 lat
for @$grammar_action -> $p {
    for $p.value() -> $d {
	    for @$d -> $n {
		    say $n.value()[1];
		}
	}
}