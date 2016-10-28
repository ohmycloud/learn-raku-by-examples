#use Grammar::Debugger;
#use Grammar::Tracer;

# 第一个 Grammar, 修改了很多次, 借助于 Grammar::Debugger 和 Grammar::Tracer 方便看出 Grammar 在哪里失败.
# TOP 里面添加了 ^ 和 $ 限制时, 其后面的 token 和 rule 不能在添加 ^ 和 $, 否则匹配失败 

use v6;
grammar Markdown::Toc {
    # token TOP   is breakpoint    {^ \s* <section>* $}
	token TOP    {^ \s* <section>* $}
	token section   { 
	    <sname> <ws>
		<lines>*
	    <subsection>+
	}	
	
    token subsection  {
    	<subsname> <ws>
        <lines>*
        <s2section> *
	}
	
    token s2section {
	    <s2name> <ws>
		<lines>*
    }
	
	token sname          { <sigil2>   <ws> <snumber=.hnumber> <ws> <shead=.hline>  }
	token subsname       { <sigil3>   <ws> <subnumber=.number>    <shline=.hline>      } 
	token s2name         { <sigil4>   <ws> <s2number=.number> <s2hline=.hline>   }
	token lines          {
	    [
		    <!after '#' ** 2..* >
            \N
        ]+
	    \n
	}
	
	token number {
	    \d+ % \.
	}
	
	token hline {
	    \N+
	}
	token hnumber { \w+}
	token ws     { \s*      }
	token sigil2 { '#' ** 2 }
	token sigil3 { '#' ** 3 }
	token sigil4 { '#' ** 4 }
}

my $str = q:to/EOF/; 
## 第三章 操作符
blabla
#blabla
blabla
blabla
###  3.1 关于优先级的的一句话
blabla
###  3.2 比较和智能匹配
blabla
####   3.2.1 数字比较
blabla
####    3.2.2 字符串比较
blabla
####    3.2.3 智能匹配
blabla
### 3.3 测试
## 第四章 子例程和签名
blabla
###  4.1 申明子例程
blabla
###  4.2 添加签名
blabla
####   4.2.1 基础
blabla
####    4.2.2 传递数组、散列和代码
blabla
####    4.2.3 插值、数组和散列
blabla
EOF

class Markdown::Toc::Actions {
	method s2section($/)        { 
	    my $first = ~$<s2name><s2number>;
	    my $second = ~$<s2name><s2hline>;
		my $remove_dot = $first.subst(rx/\./,'',:g);
		my $remove_space = $second.subst(rx/\s+/,'-',:g);
		make '    - '~'['~$first~' '~$second~']' ~ '(#'~$remove_dot~$remove_space ~ ')' => $<s2section>>>.made;                                                            
	}
	
	method subsection($/) { 
	    my $first = ~$<subsname><subnumber>;
	    my $second = ~$<subsname><shline>;
		my $remove_dot = $first.subst(rx/\./,'',:g);
		my $remove_space = $second.subst(rx/\s+/,'-',:g);
		make '  - '~'['~$first~' '~$second~']' ~ '(#'~$remove_dot~$remove_space ~ ')'	=> $<s2section>>>.made;  
	}
	
    method section($/)    { 
	    my $first = ~$<sname><snumber>;
		my $second = ~$<sname><shead>;
		#my $remove_dot = $first.subst(rx/\./,'',:g);
		my $remove_space = $second.subst(rx/\s+/,'',:g);
	    make '- '~'['~$first~' '~$second~']' ~ '(#'~$first~ '-'~$remove_space ~ ')'  => $<subsection>>>.made;                                
	}    
	
    method TOP($/)    { make $<section>>>.made;                                                            }

} 

my $actions = Markdown::Toc::Actions.new;
my $match  = Markdown::Toc.parse($str, :$actions).made;
#say $match.Str;

for @$match -> $p {
    say $p.key(); 
    for $p.value() -> $v {
        for $v -> $n {
		   .say for $n.hash().keys();
		   for $n.hash().values() -> $three {
		       .say for $three.hash().keys();
			}
		}
		   
    }		
}