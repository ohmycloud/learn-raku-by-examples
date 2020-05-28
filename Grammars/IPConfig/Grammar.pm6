#use Grammar::Tracer;
#use Grammar::Debugger;

unit grammar IPConfig::Grammar;

# token TOP { <section>+ %% \n } # 只使用 \n 就会匹配失败
token TOP { <section>+ %% \n* }
token section {
    <header>
    \n
    <config>+
}

token header { ^^ \N+  \n         }
token config { ^^ \s+ \N+ $$ \n*  }