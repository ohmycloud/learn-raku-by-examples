my %var;

grammar Lang {
    rule TOP {
        ^ <statements> $
    }
    rule statements {
        <statement>+ %% ';'
    }
    rule statement {
        | <assignment>
        | <printout>
    }
    rule assignment {
        | (<identifier>) '=' (<value>)
          {
              %var{$0} = +$1
          }
        | (<identifier>) '=' (<identifier>)
          {
              %var{$0} = %var{$1}
          }
    }
    rule printout {
        | 'print' <value>
          {
              say +$<value>
          }
        | 'print' <identifier>
          {
              say %var{$<identifier>}
          }
    }
    token identifier {
        <:alpha>+
    }
    token value {
        \d+
    }
}

Lang.parsefile('data/test.lang');