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
	  method destination($/) { make ~$<dname> => $<sales>          }
    method country($/)     { make ~$<cname> => $<destination>    }
    method TOP($/)         { make $<country>>>.made              }
}

my $actions = SalesExport::Grammar::Actions.new;
my $grammar_action = SalesExport::Grammar.parse($string, :actions($actions)).made;

# 获取所有国家的名字
for @$grammar_action -> $p {
    say "$p.key()";
}

say  "-" x 45;
for @$grammar_action -> $p {
    for $p.value() -> $d {
	   for @$d -> $n {
	      say ~$n<dname>;
	   }
	  }
}

say  "-" x 45;

# 计算每个国家卖了多少票
for @$grammar_action -> $c {
    for $c.value() -> $d {
	   my $sales_count=0;
	   for @$d -> $n {
	      $sales_count += ~$n<sales>;
	   }
	   say $sales_count;
	  }
}


 #`(
# say $string;
my $grammar_object = SalesExport::Grammar.parse($string);
if $grammar_object {
     say "It's works";
 } else {
     # TODO: error reporting
     say "Not quite works...";
 }


# say $grammar_object;
#  say $grammar_object<country>.Str;
say "_" x 45;
# say $grammar_object<country>[0];
# say $grammar_object<country>[1].Str;

 say "_" x 45;
# say $grammar_object<country>[].Str;
# say $grammar_object<country>.values;

# 获取国家的名字
say $grammar_object<country>[0]<name>.Str;
say $grammar_object<country>[1]<name>.Str;
say $grammar_object<country>[2]<name>.Str;

 say "_" x 45;
# 获取目的地
say $grammar_object<country>[0]<destination>[0]<name>.Str;
say $grammar_object<country>[0]<destination>[1]<name>.Str;

 say "_" x 45;
# 获取经度
say $grammar_object<country>[0]<destination>[0]<lat>.Str;
say $grammar_object<country>[0]<destination>[1]<lat>.Str;

 say "_" x 45;
# 获取纬度
say $grammar_object<country>[0]<destination>[0]<long>.Str;
say $grammar_object<country>[0]<destination>[1]<long>.Str;

 say "_" x 45;
# 获取sales
say $grammar_object<country>[0]<destination>[0]<sales>.Str;
say $grammar_object<country>[0]<destination>[1]<sales>.Str;

 say "_" x 45;
 # 获取所有国家
say $grammar_object<country>»<name>.Str;

 say "_" x 45;
 # 获取第一个国家的所有目的地
 say $grammar_object<country>[0]<destination>»<name>.Str;

 say "_" x 45;
 # 获取第一个国家的所有的 sales
 say $grammar_object<country>[0]<destination>»<sales>.Str;
)
