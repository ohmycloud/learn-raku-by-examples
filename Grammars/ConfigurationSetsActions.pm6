use Pairs::KeyValuePairsActions;

unit class ConfigurationSetsActions is KeyValuePairsActions;

method configuration-element($match) {
    $match.make: $match<pair>».made
}

method TOP ($match) {
    my @made-elements = gather for $match<configuration-element> {
        take $_.made
    };
    $match.make( @made-elements );
}