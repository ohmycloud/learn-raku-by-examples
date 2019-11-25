#!/usr/bin/env perl6

say so '你好'~~ /你好/; # doesn't need to be quoted
say '你好'.uniprop('Script');        # Han
say '你好, hello'.uniprop('Script'); # Han
say '안녕하세요'.uniprop('Script');    # Hangul
say 'こんにちは'.uniprop('Script');   # Hiragana

# http://www.unicode.org/reports/tr24/
# <:Hani> 是 <:Han> 的长形式
say 'Raku 入门abc指南'.comb(/<:Han>+/).join(','); # 入门,指南
say 'Raku 入门abc指南'.comb(/<:Hani>+/).join(','); # 入门,指南

say so ₆ ~~ /<:No>/;