use v6;

# Unpacking Hashes

# Can extract values by key

sub show_place((:$name, :$lat, :$long, *%rest)) {
    say "$name lies at $lat,$long.";
    say "Other facts:";
    for %rest.kv -> $title, $data {
        say "    $title.wordcase(): $data";
        }
}

my %info = name => 'Kiev', lat => 50.45,
long => 30.52, population => 2611300;
show_place(%info);





