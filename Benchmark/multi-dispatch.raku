 use Test;

    multi sub whats_my_type (Str $item) {
        return "This is a Str: $item";
    }

    subset GoofyNum of Str where * eq any( 'wuhn', 'tew', 'thuree' ) ;
    multi sub whats_my_type (GoofyNum $item) {
        return "This is a GoofyNum string: $item";
    }

    {
        my ($ret, $arg);
        $ret =  whats_my_type('two');
        like $ret, /<< Str >>/, "quoted string argument of 'two' is Str";

        $ret = whats_my_type('tew');
        like $ret,  /<< GoofyNum >>/, "quoted string argument of 'wuhn' is 'goofy'";

        $arg = "one";
        $ret = whats_my_type( $arg );
        like $ret, /<< Str >>/, "string in var argument of '$arg' is Str";

        $arg = "whun";
        $ret = whats_my_type( $arg );
        like $ret, /<< GoofyNum >>/, "string in var argument of 'wuhn' is 'goofy'";
    }