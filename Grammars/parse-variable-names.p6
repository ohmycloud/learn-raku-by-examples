grammar VariableNames {

    token variable {
        <sigil> <name>
    }
	
    token sigil {
        '$' | '@' | '&' | '%' | '::'
    }
	
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

my $match = VariableNames.parse("@array",:rule('variable'));
say $match;

# we inherit from the original grammar...
grammar VARIABLENAMES is VariableNames {
    
    # ... and override that parsing rule that we want to change
    token identifier {
        # char classes are <[ ... ]> in Perl 6
        <[A..Z]> <[A..Z0..9_]>* 
    }
}
my $test = VARIABLENAMES.parse("%A_HASH_TABLE",:rule('variable'));
say $test;

grammar LackMoney is VariableNames {
    token sigil {
        '¢' | '@' | '&' | '%' | '::'
    }
}

# 继承以后, 带¢的变量能够解析, 带$的变量解析不了了
my $money = LackMoney.parse('$i_m_not_dollor',:rule('variable'));
say so $money; # false
