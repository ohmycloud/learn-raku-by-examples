#!/usr/bin/env perl6

say '⅟'.uniname;  # FRACTION NUMERATOR ONE


say '↉'.uniname; # VULGAR FRACTION ZERO THIRDS
say '⅔'.uniname;  # VULGAR FRACTION TWO THIRDS
say '¾'.uniname;  # VULGAR FRACTION THREE QUARTERS

say '⅖'.uniname; # VULGAR FRACTION TWO FIFTHS
say '⅗'.uniname; # VULGAR FRACTION THREE FIFTHS
say '⅘'.uniname; # VULGAR FRACTION FOUR FIFTHS

say '⅚'.uniname; #  VULGAR FRACTION FIVE SIXTHS


say '⅜'.uniname;  # VULGAR FRACTION THREE EIGHTHS
say '⅝'.uniname;  # VULGAR FRACTION FIVE EIGHTHS
say '⅞ '.uniname; # VULGAR FRACTION SEVEN EIGHTHS

say '½'.uniname; # VULGAR FRACTION ONE HALF
say '⅓'.uniname; # VULGAR FRACTION ONE THIRD
say '¼'.uniname; # VULGAR FRACTION ONE QUARTER
say '⅕'.uniname; # VULGAR FRACTION ONE FIFTH
say '⅙'.uniname; # VULGAR FRACTION ONE SIXTH
say '⅐'.uniname; # VULGAR FRACTION ONE SEVENTH
say '⅛'.uniname;  # VULGAR FRACTION ONE EIGHTH
say '⅑'.uniname; # VULGAR FRACTION ONE NINTH
say '⅒'.uniname; # VULGAR FRACTION ONE TENTH

say "\c[VULGAR FRACTION ONE HALF]";    # ½
say "\c[VULGAR FRACTION ONE THIRD]";   # ⅓
say "\c[VULGAR FRACTION ONE QUARTER]"; # ¼
say "\c[VULGAR FRACTION ONE FIFTH]";   # ⅕
say "\c[VULGAR FRACTION ONE SIXTH]";   # ⅙
say "\c[VULGAR FRACTION ONE SEVENTH]"; # ⅐
say "\c[VULGAR FRACTION ONE EIGHTH]";  # ⅛
say "\c[VULGAR FRACTION ONE NINTH]";   # ⅑
say "\c[VULGAR FRACTION ONE TENTH]";   # ⅒

say ⅒ * 3;
say '⅒'.uniname;  # VULGAR FRACTION ONE TENTH
say '⁄'.uniname;  # FRACTION SLASH
say "\x[2044]";   # ⁄, fraction slash
say "\x[2079,2044,2081,2080]"; # ⁹⁄₁₀
say '⁹⁄₁₀'.uniname; # SUPERSCRIPT NINE
say 'ⁿ'.uniname;  # SUPERSCRIPT LATIN SMALL LETTER N

say 'ⁿ'.uniprop('Script'); # Latin

say so 'ⁿ'.uniname ~~ /SCRIPT/; # True

for 1 .. 0x10FFFD {
    .chr.print if .chr ~~ /<:digit>/ && .uniname ~~ /Script/;
}

# SUBSCRIPT ZERO - SUBSCRIPT NINE
say "\x[2080]"; # ₀
say "\x[2081]"; # ₁
say "\x[2082]"; # ₂
say "\x[2083]"; # ₃
say "\x[2084]"; # ₄
say "\x[2085]"; # ₅
say "\x[2086]"; # ₆
say "\x[2087]"; # ₇
say "\x[2088]"; # ₈
say "\x[2089]"; # ₉

say "SUBSCRIPT ZERO".uniparse;  # ₀
say "SUBSCRIPT ONE".uniparse;   # ₁
say "SUBSCRIPT TWO".uniparse;   # ₂
say "SUBSCRIPT THREE".uniparse; # ₃
say "SUBSCRIPT FOUR".uniparse;  # ₄
say "SUBSCRIPT FIVE".uniparse;  # ₅
say "SUBSCRIPT SIX".uniparse;   # ₆
say "SUBSCRIPT SEVEN".uniparse; # ₇
say "SUBSCRIPT EIGHT".uniparse; # ₈
say "SUBSCRIPT NINE".uniparse;  # ₉

say "\c[SUBSCRIPT ZERO]";  # ₀
say "\c[SUBSCRIPT ONE]";   # ₁
say "\c[SUBSCRIPT TWO]";   # ₂
say "\c[SUBSCRIPT THREE]"; # ₃
say "\c[SUBSCRIPT FOUR]";  # ₄
say "\c[SUBSCRIPT FIVE]";  # ₅
say "\c[SUBSCRIPT SIX]";   # ₆
say "\c[SUBSCRIPT SEVEN]"; # ₇
say "\c[SUBSCRIPT EIGHT]"; # ₈
say "\c[SUBSCRIPT NINE]";  # ₉

say '₀'.uniname; # SUBSCRIPT ZERO
say '₁'.uniname; # SUBSCRIPT ONE
say '₂'.uniname; # SUBSCRIPT TWO
say '₃'.uniname; # SUBSCRIPT THREE
say '₄'.uniname; # SUBSCRIPT FOUR
say '₅'.uniname; # SUBSCRIPT FIVE
say '₆'.uniname; # SUBSCRIPT SIX
say '₇'.uniname; # SUBSCRIPT SEVEN
say '₈'.uniname; # SUBSCRIPT EIGHT
say '₉'.uniname; # SUBSCRIPT NINE

# SUPERSCRIPT ZERO - SUPERSCRIPT NINE
say "\c[SUPERSCRIPT ZERO]".ord;  # 8304
say "\c[SUPERSCRIPT ONE]".ord;   # 185
say "\c[SUPERSCRIPT TWO]".ord;   # 178
say "\c[SUPERSCRIPT THREE]".ord; # 179
say "\c[SUPERSCRIPT FOUR]".ord;  # 8308
say "\c[SUPERSCRIPT FIVE]".ord;  # 8309
say "\c[SUPERSCRIPT SIX]".ord;   # 8310
say "\c[SUPERSCRIPT SEVEN]".ord; # 8311
say "\c[SUPERSCRIPT EIGHT]".ord; # 8312
say "\c[SUPERSCRIPT NINE]".ord;  # 8313

say "SUPERSCRIPT ZERO".uniparse;  # ⁰
say "SUPERSCRIPT ONE".uniparse;   # ¹
say "SUPERSCRIPT TWO".uniparse;   # ²
say "SUPERSCRIPT THREE".uniparse; # ³
say "SUPERSCRIPT FOUR".uniparse;  # ⁴
say "SUPERSCRIPT FIVE".uniparse;  # ⁵
say "SUPERSCRIPT SIX".uniparse;   # ⁶
say "SUPERSCRIPT SEVEN".uniparse; # ⁷
say "SUPERSCRIPT EIGHT".uniparse; # ⁸
say "SUPERSCRIPT NINE".uniparse;  # ⁹

say "\c[SUPERSCRIPT ZERO]";  # ⁰
say "\c[SUPERSCRIPT ONE]";   # ¹
say "\c[SUPERSCRIPT TWO]";   # ²
say "\c[SUPERSCRIPT THREE]"; # ³
say "\c[SUPERSCRIPT FOUR]";  # ⁴
say "\c[SUPERSCRIPT FIVE]";  # ⁵
say "\c[SUPERSCRIPT SIX]";   # ⁶
say "\c[SUPERSCRIPT SEVEN]"; # ⁷
say "\c[SUPERSCRIPT EIGHT]"; # ⁸
say "\c[SUPERSCRIPT NINE]";  # ⁹

say '⁰'.uniname; # SUPERSCRIPT ZERO
say '¹'.uniname; # SUPERSCRIPT ONE
say '²'.uniname; # SUPERSCRIPT TWO
say '³'.uniname; # SUPERSCRIPT THREE
say '⁴'.uniname; # SUPERSCRIPT FOUR
say '⁵'.uniname; # SUPERSCRIPT FIVE
say '⁶'.uniname; # SUPERSCRIPT SIX
say '⁷'.uniname; # SUPERSCRIPT SEVEN
say '⁸'.uniname; # SUPERSCRIPT EIGHT
say '⁹'.uniname; # SUPERSCRIPT NINE


say "\x[2140]"; # ⅀
say "\x[2142]"; # ⅂
say "\x[2143]"; # ⅃
say "\x[2144]"; # ⅄
say "\x[2145]"; # ⅅ
say "\x[2146]"; # ⅆ
say "\x[2147]"; # ⅇ
say "\x[2148]"; # ⅈ
say "\x[2149]"; # ⅉ
say "\x[2150]"; # ⅐
say "\x[2151]"; # ⅑
say "\x[2152]"; # ⅒
say "\x[2153]"; # ⅓
say "\x[2154]"; # ⅔
say "\x[2155]"; # ⅕
say "\x[2156]"; # ⅖
say "\x[2157]"; # ⅗
say "\x[2158]"; # ⅘
say "\x[2159]"; # ⅙
say "\x[2160]"; # Ⅰ
say "\x[2161]"; # Ⅱ
say "\x[2162]"; # Ⅲ
say "\x[2163]"; # Ⅳ
say "\x[2164]"; # Ⅴ
say "\x[2165]"; # Ⅵ
say "\x[2166]"; # Ⅶ
say "\x[2167]"; # Ⅷ
say "\x[2168]"; # Ⅸ
say "\x[2169]"; # Ⅹ
say "\x[2170]"; # ⅰ
say "\x[2171]"; # ⅱ
say "\x[2172]"; # ⅲ
say "\x[2173]"; # ⅳ
say "\x[2174]"; # ⅴ
say "\x[2175]"; # ⅵ
say "\x[2176]"; # ⅶ
say "\x[2177]"; # ⅷ
say "\x[2178]"; # ⅸ
say "\x[2179]"; # ⅹ
say "\x[2180]"; # ↀ
say "\x[2181]"; # ↁ
say "\x[2182]"; # ↂ
say "\x[2183]"; # Ↄ
say "\x[2184]"; # ↄ
say "\x[2185]"; # ↅ
say "\x[2186]"; # ↆ
say "\x[2187]"; # ↇ