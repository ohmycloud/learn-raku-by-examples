use Grammar::Debugger;
use Grammar::Tracer;

# 第一个 Grammar, 修改了很多次, 借助于 Grammar::Debugger 和 Grammar::Tracer 方便看出 Grammar 在哪里失败.
# TOP 里面添加了 ^ 和 $ 限制时, 其后面的 token 和 rule 不能在添加 ^ 和 $, 否则匹配失败 

use v6;
grammar Markdown::Toc {
    # token TOP   is breakpoint    {^ \s* <section>* $}
	token TOP    {^ \s* <section>* $}
	token section   { 
	    <sname>  <ws> \n
		<lines>*
	    <subsection>+
	}	
	
    token subsection  {
    	<subsname> <ws> \n
        <lines>*
        <s2section> *
	}
	
    token s2section {
	    <s2name> <ws> \n
		<lines>*
    }
	
	token sname          { <sigil2>   <ws> <snumber=.hnumber>  <ws> <shead=.hline>     }
	token subsname       { <sigil3>   <ws> <subnumber=.number> <ws> <shline=.hline>    } 
	token s2name         { <sigil4>   <ws> <s2number=.number>  <ws> <s2hline=.hline>   }
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
	token hnumber { \w+      }
	token ws      { \h*      }
	token sigil2  { '#' ** 2 }
	token sigil3  { '#' ** 3 }
	token sigil4  { '#' ** 4 }
}

my $str = q:to/EOF/; 
## 第四章 子例程和签名
 
 
一个子例程就是一段执行特殊任务的代码片段。它可以对提供的数据（`实参`）操作，并产生结果（返回值）。子例程的签名是它`所含的参数`和它产生的`返回值`的描述。从某一意义上来说，第三章描述的操作符也是Perl 6用特殊方式解释的子例程。
 
### 4.1.0 申明子例程

 一个子例程申明由几部分组成。首先， `sub `表明你在申明一个子例程，然后是可选的子例程的名称和`可选的签名`。子例程的主体是一个用花括号扩起来的代码块。
默认的，子例程是本地作用域的，就像任何使用 `my` 申明的变量一样。这意味着，一个子例程只能在它被申明的作用域内被调用。使用 `our` 来申明子例程可以使其在`当前包`中可见。
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