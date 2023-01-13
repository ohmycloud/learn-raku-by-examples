grammar KeyValuePairs {
    token TOP {
        [<pair> \v+]*
    }

    token pair {
        <key=.identifier> '=' <value=.identifier>
    }

    token identifier {
        \w+
    }
}