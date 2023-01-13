role Entry {
    has Str $.name;
    method print-list() { !!! }
}

class File does Entry {
    method print-list( Str $prefix ) {
        say $prefix ~ '/' ~ self.name;
    }
}

class Directory does Entry {
    has Array $!directory = Array.new;
    method add( Entry $entry --> Entry ){
        $!directory.append($entry);
        return self;
    }
    method print-list( Str $prefix ) {
        say $prefix ~ '/' ~ self.name;
        for @$!directory -> $entry {
            $entry.print-list($prefix ~ '/' ~ self.name);
        }
    }
}

my $workspace-dir = Directory.new( name => 'workspace' );
my $composite-dir = Directory.new( name => 'composite' );
my $test-dir1 = Directory.new( name => 'test1' );
my $test-dir2 = Directory.new( name => 'test2' );
$workspace-dir.add($composite-dir);
$workspace-dir.add($test-dir1);
$workspace-dir.add($test-dir2);

my $directory = File.new( name => 'Directory.pm6' );
my $file = File.new( name => 'File.pm6' );
my $entry = File.new( name => 'Entry.pm6' );
my $main = File.new( name => 'main.p6' );

$composite-dir.add($directory);
$composite-dir.add($entry);
$composite-dir.add($file);
$composite-dir.add($main);

$workspace-dir.print-list('');
