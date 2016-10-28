# The sleep function argument is in units of seconds, but these may be fractional (to the limits of your system's clock). 
my $sec = prompt("Sleep for how many microfortnights? ") * 1.2096;
say "Sleeping...";
sleep $sec;
say "Awake!";
