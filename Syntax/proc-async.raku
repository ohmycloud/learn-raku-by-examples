my $proc = Proc::Async.new('echo', 'foo', 'bar');

$proc.stdout.tap(-> $v { print "Output: $v" });
$proc.stderr.tap(-> $v { print "Error:  $v" });

say "Starting...";
my $promise = $proc.start;
 
await $promise;
say "Done.";
 
# Output: 
# Starting... 
# Output: foo bar 
# Done.