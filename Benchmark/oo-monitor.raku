use OO::Monitors;
monitor TestMonitor {
    method m() { 1 }
}
my $mon = TestMonitor.new;
for ^1_000_000 {
    $mon.m();
}