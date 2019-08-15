grammar MyGrammar {
    token chunk {
        { say "chunk: called" }
        ^^
        { say "chunk: found start of line" }
        (\S+) 
        { say "chunk: found first identifier: $0" }
		#(\s*)
		#{say "chunk: found space"}
        \= 
        { say "chunk: found =" }
		#(\s*)
		#{say "chunk: found space"}
        (\S+) $$
    }
}

say ?MyGrammar.parse("foo = bar", :rule<chunk>);

# output:
#
# chunk: called
# chunk: found start of line
# chunk: found fist identifer: foo
# False

#You can see that the rule matched the start of the line, and foo, but not the equals sign. What's between the two? A space. For which there is no rule to match it. Making chunk a rule instead of a token fixes this problem.
# 因为 (\S+)后面有一个空格, \= 后面也有个空格, rule 能识别空格

# E:\1-技术书籍\Perl6\examples\Grammars>perl6 -e "'aabcd' ~~ /^ (.*){say $0.Str} b/"
#aabcd
#aabc
#aab
#aa