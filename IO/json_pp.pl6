use JSON::Tiny;
my %json = ( "KeyValue" => "Something", "Array" => [ "one", "two", "three" ] );
my $p = run "/usr/bin/json_pp", :in, :out;
# Pipe to command
$p.in.say(to-json %json);
$p.in.close;
# Catch output
$p.out.lines.join("\n").say;
