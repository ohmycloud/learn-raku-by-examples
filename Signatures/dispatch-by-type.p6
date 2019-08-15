use v6;

# Example: part of a JSON emitter

multi to-json(Array $a) {
    return '[ ' ~
        $a.values.map({ to-json($_) }).join(', ') ~
        ' ]';
}

multi to-json(Hash $h) {
    return '{ ' ~
        $h.pairs.map({
            to-json(.key) ~ ': ' ~ to-json(.value)
        }).join(', ') ~
        ' }';
}