use v6;
use Grammar::Debugger;

grammar University {
    token TOP {
        ^ <line>+ $
    }

    token line { # 每一行
        \d+
        \s+
	    <university>+ % <semicolon>
        \n
    }

    token university { # 每所大学
	      <student>
          \s+
	      <univinfo>
    }

    token student {  # 报考该大学的学生(s)
        \[
        <stuname>+ % <semicolon>
        \]
    }

    token stuname { # 学生的名字
        <myname>+ % <comma>
    }

    token univinfo { # 大学的信息
        <field>+ % <comma>
    }

    token field {
        <[A..Za..z0..9\s&]>+
    }

    token myname {
        <[A..Za..z-]>+
    }

    token comma {
        ',' \s+
    }

    token semicolon {
        ';' \s+
    }
}

my $parse = University.parsefile('university.txt');
say $parse;
