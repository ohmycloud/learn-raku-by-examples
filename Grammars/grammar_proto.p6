grammar Perl6VariableNames {

    token variable {
        <sigil> <name>
    }
	
    #token sigil {
    #    '$' | '@' | '&' | '%' | '::'
    #}

    # 使用 proto	
	proto token sigil {*}
    token sigil:sym<$>  { <sym> }
    token sigil:sym<@>  { <sym> }
    token sigil:sym<%>  { <sym> }
    token sigil:sym<&>  { <sym> }
    token sigil:sym<::> { <sym> }
	
	# [ ... ] are non-capturing groups
	token name {
        <identifier> 
        [ '::' <identifier> ] * 
    }
	# 标识符以字母开头
    token identifier {
        <alpha> \w+
    }
}

my $match = Perl6VariableNames.parse("@array",:rule('variable'));
say $match;

grammar SigilRichPerl6 is Perl6VariableNames {
    token sigil:sym<ħ> { <sym> } # physicists will love you
}

my $rich = SigilRichPerl6.parse("ħarray",:rule('variable'));
say $rich;

grammar LowBudgetPerl6 is Perl6VariableNames {
    token sigil:sym<$> { '¢' }
}

my $money = LowBudgetPerl6.parse('$array',:rule('variable'));
say $money;