unit class BusInfo::Action;

method TOP($/) {
    make $/<network>>>.made;
}

method network($/) {
    if $/.contains('bus info:') {
        make ~$/;
        for $/<colon-line> -> $line {
            printf "%-15s ", ~$line<field>;
        }

        print("\n");

        for $/<colon-line> -> $line {
            printf "%-15s ", ~$line<value>;
        }
    } else {
        make Empty;
    }
}

method header($/) {
    make Empty;
}

method colon-line($/) {
    make ~$/;
}

method field($/) {
    make ~$/.trim;
}

method value($/) {
    make ~$/;
}