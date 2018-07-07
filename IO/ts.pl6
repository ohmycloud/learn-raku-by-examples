use v6;
use Slang::Tuxic;
use Text::CSV;

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


my $line_count = 5000;

my $bigfile = "_file.csv";
my $io = open $bigfile, :w;

$csv.print ($io, @fields10) or die "Cannot print ()\n";

$io.close;
my $l = $bigfile.IO.s;
$l or die "Buffer/file is empty!\n";
my @f = @fields10;
#$csv.can ("bind_columns") and $csv.bind_columns (\(@f));
$io = open $bigfile;

$io.close;
print "Data was $l bytes long, line length {$str10.chars}\n";
