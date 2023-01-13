my $name     = "twostraws";
my $password = "fr0st1es";

given ($name, $password) {
  when ("bilbo", "bagg1n5")      { say "Hello, Bilbo Baggins!" }
  when ("twostraws", "fr0st1es") { say "Hello, Paul Hudson!"   }
  default                        { say "你是谁?"                }
}
