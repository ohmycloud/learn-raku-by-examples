use v6;
use CSV::Parser;

my $fh = open "cmgd.csv", :r;
my @lines = "JournalList_cn.txt".IO.lines;
my %iscn;
for @lines[1..*] -> $line {
    my ($iscn, $number) = $line.split(/\s+/);
    %iscn{$iscn} = $number;
}

grammar University::Grammar {
    token TOP             { ^ <university> $             }
    token university      { [ <bracket> <info> ]+ % '; ' }
    token bracket         { '[' <studentname>  '] '      }
    token studentname     { <stdname=.info>+ % '; '      }
    token info            { <field>+ % ', '              }
    token field           { <-[,\]\[;\n]>+               }
}

grammar MyUniversity  is University::Grammar {
    token university      { <info>+ % '; ' }
}

my $parser = CSV::Parser.new(file_handle => $fh,  contains_header_row => False);
my %data;
my $count = 1;
while %data = %($parser.get_line()) {

    my @universitys;
    my @countrires;

    my $parsed;
    if %data{'1'} ~~ /'['/ {
        $parsed = University::Grammar.parse(%data{'1'});
    } else {
        $parsed = MyUniversity.parse(%data{'1'});
    }

    print $count, "\t";
    $count++;

    # 作者数量
    print 1+@$(%data{'0'} ~~ m:g/';'/);
    print "\t";

    # 机构
    for @($parsed<university><info>) -> $f {
        push @universitys, $f<field>[0].Str;
    }

    print join ", ", @universitys.unique;
    print "\t";

    # 国别
    for @($parsed<university><info>) -> $f {
        push @countrires, $f<field>[*-1].Str;
    }

    print join ", ", @countrires.unique;
    print "\t";

    # 学科
    print %iscn{%data{'2'}};
    print "\t";

    # 年份
    say %data{'3'};
}
