use v6;
#use Grammar::Debugger;

grammar Lines {
    token TOP {
        ^ <line>+ $
    }

    token line {
        \[
        <student>+ % <semicolon>
        \]
        \n                   # 换行 \n 是最容易被忽略的地方, 坑了很多次了！
    }

    token student {
       <myname>+ % <comma>   # 分隔符也可以是一个 subrule
    }

    token myname {
        <[A..Za..z-]>+       # 字符类的写法 <[...]>
    }

    token comma {
        ',' \s+              # 逗号, 分号 不能裸露出现在 token 中
    }

    token semicolon {
        ';' \s+
    }

}

my $parse = Lines.parsefile('test.txt');
say $parse<line>;
