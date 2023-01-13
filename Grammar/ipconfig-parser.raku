#!/usr/bin/env raku
use v6.d;

grammar IPConfig::Grammar {
    token TOP { <section>+ %% \n* }
    token section {
        <header>
        \n
        <config>+
    }

    token header { ^^ \N+  \n         }
    token config { ^^ \s+ \N+ $$ \n*  }
}

class IPConfig::Action {
    method TOP($/) {
        make $/<section>».made;
    }

    method section($/) {
        my $configs = $/<config>».made;
        if $configs.elems > 0 {
            make ~$/<header>  ~ $configs.join('');
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
}

my $ipconfig = IPConfig::Grammar.parsefile(
        "ipconfig.txt",
        :actions(IPConfig::Action)
        ).made;

.Str.say for @$ipconfig;