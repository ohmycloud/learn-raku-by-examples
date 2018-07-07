# Pointy loops can also destructure hashes, allowing assignment to variables:
my %hhgttu = (:40life, :41universe, :42everything);
   for %hhgttu -> (:$key, :$value) {
     say "$key → $value";
}
