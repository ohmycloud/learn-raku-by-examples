> 15 + 27
42
> <beer vodka whisky>.pick
beer
> <beer vodka whisky>.pick(2)
beer whisky
> (1, 1, *+* ... *)[20]
10946
>  dir>>.path
> dir>>.path ==> grep /\.p6$/
REPL.p6 slides.p6

> type REPL.p6 | perl6 -e "$*IN.slurp-rest.comb(/\w+/) ==> sort *.chars ==> @temp ==> reverse @temp ==> @reverse ==> say @reverse
> type REPL.p6 | perl6 -e "$*IN.slurp-rest.comb(/\w+/) ==> sort *.chars ==> reverse @() ==> join \"\n\" ==> say @()"
> type Hamlet.txt | perl6 -e "say [max] $*IN.slurp-rest.comb(/\d+/)"

# slurp reads a file into a scalar
> dir>>.path ==> grep /\.p6$/ ==> sort { slurp($_).chars }
slurp_feed.p6 REPL.p6 slides.p6

# lines reads the lines of a file into an array
> dir>>.path ==> grep /\.p6$/ ==> sort { +lines($_) }
REPL.p6 slides.p6 slurp_feed.p6
# 求出所有 words的和
> type 3col.txt | perl6 -e "say [+] $*IN.lines>>.words"
> type 3col.txt | perl6 -e "say [+] $*IN.lines>>.words>>.elems # word 的个数
> type 3col.txt | perl6 -e "say [+] $*IN.lines>>.words>>.[2]