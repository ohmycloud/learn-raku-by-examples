use Pairs::KeyValuePairs;

unit grammar ConfigurationSets is KeyValuePairs;

token TOP {
    <configuration-element>+ %% \v
}

token configuration-element {
    <pair>+ %% \v
}

token comment {
    \s* '#' .+? $$
}

token pair {
    <key=.identifier> '=' <value=.identifier> <comment>?
}