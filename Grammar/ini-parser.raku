#!/usr/bin/env raku
use v6.d;

grammar INIFile {
    token TOP { <section>* }
    token section {
        <header>
        <keyvalue>*
    }
    # 在 rule 中, 看得见的空白会被编译器隐式地替换成 <.ws>
    # 在有大量空白的地方, rule 反而比 token 更好用
    rule header {
        '[' ~ ']' <-[ \] \n ]>+ <.eol>
    }
    rule keyvalue {
        ^^
        $<key>=[\w+]
        <[:=]>
        $<value>=[<-[\n;#]>*]
        <.eol>
    }
    token ws { <!ww> \h* }
    token eol {
        \n [\h*\n]*
    }
}

my $ini = q:to/END/;
[db]
driver: mysql
host: db01.example.com
port: 122
username: us123
password: s3kr1t
[user]
name = rakudo
email = ohmycloud@gmail.com
END

my $match = INIFile.parse($ini);
dd $match;
