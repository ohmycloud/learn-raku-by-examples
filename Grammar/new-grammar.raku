grammar G {
    token TOP { <word>   }
    method word(--> Match:D) {
        my Match $new := regex {:r:s <alpha>+ }(self);
        $.actions.?word($new) if $new;
        $new
    #   ^^^^ NOTE: returns $new, **not** self. Here, $new is
    # a Grammar (which isa Match), but could be any Match:D
    }
}