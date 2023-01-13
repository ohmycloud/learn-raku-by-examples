class KeyValuePairsActions {
    method pair      ($/) {
        $/.make: $<key>.made => $<value>.made
    }
    method identifier($/) {
        # subroutine `make` is the same as calling .make on $/
        make ~$/
    }

    method TOP ($match) {
        # can use any variable name for parameter, not just $/
        $match.make: $match<pair>».made
    }
}