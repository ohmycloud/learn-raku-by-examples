#!perl6

# speed.pl: compare different versions of Text-CSV* modules
#          (m)'15 [01 Jun 2015] Copyright H.M.Brand 2007-2015

use v6;
use Slang::Tuxic;
use Text::CSV;
use Bench;

my $b = Bench.new;
my $csv = Text::CSV.new (eol => "\n");

my Str @fields1 = (
    "Wiedmann", "Jochen",
    "Am Eisteich 9",
    "72555 Metzingen",
    "Germany",
    "+49 7123 14881",
    "joe\@ispsoft,de");
my @fields10  = (@fields1) xx 10;
my @fields100 = (@fields1) xx 100;

$csv.combine (@fields1  ); my $str1   = $csv.string;
$csv.combine (@fields10 ); my $str10  = $csv.string;
$csv.combine (@fields100); my $str100 = $csv.string;

$b.timethese (100, {

    "combine   1" => sub { $csv.combine (@fields1  ) },
    "combine  10" => sub { $csv.combine (@fields10 ) },
    "combine 100" => sub { $csv.combine (@fields100) },

    "parse     1" => sub { $csv.parse   ($str1     ) },
    "parse    10" => sub { $csv.parse   ($str10    ) },
    "parse   100" => sub { $csv.parse   ($str100   ) },
    });

my $line_count = 5000;

my $bigfile = "_file.csv";
my $io = open $bigfile, :w;

$csv.print ($io, @fields10) or die "Cannot print ()\n";
$b.timethese ($line_count, {
    "print    io" => sub { $csv.print ($io, @fields10) },
    });
$io.close;
my $l = $bigfile.IO.s;
$l or die "Buffer/file is empty!\n";
my @f = @fields10;
#$csv.can ("bind_columns") and $csv.bind_columns (\(@f));
$io = open $bigfile;
$b.timethese ($line_count, {
    "getline  io" => sub { $csv.getline ($io) },
    });
$io.close;
print "Data was $l bytes long, line length {$str10.chars}\n";
unlink $bigfile;
