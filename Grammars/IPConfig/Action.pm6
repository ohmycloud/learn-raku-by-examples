unit class IPConfig::Action;

method TOP($/) {
    make $/<section>».made;
}

method section($/) {
    my $configs = $/<config>».made;
    if $configs.elems > 0 {
        # say $configs.raku;
        # make ~$/<header> ~ "\n" ~ $configs; #  $configs是数组, 直接使用 ~ 连接会加上多余的空格
        make ~$/<header>  ~ $configs.join("");
    } else {
        make Empty;
    }
}

method header($/) {
    make ~$/;
}

method config($/ is copy) {
    my $text = ~$/;
    if $text.contains(/'描述' | '物理地址' | IPv[4|6] ' ' 地址 | '子网掩码' | DNS ' ' 服务器/) {
         $/.make(~$/);
    } else {
        make Empty;
    }
}