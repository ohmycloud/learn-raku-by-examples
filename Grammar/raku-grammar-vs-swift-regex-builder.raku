#use Grammar::Debugger;
#use Grammar::Tracer;

my $text = q:to/END/;
CREDIT  03/02/2022  Payroll from employer       $200.23
CREDIT  03/03/2022  Suspect A                   $2,000,000.00
DEBIT   03/03/2022  Ted's Pet Rock Sanctuary    $2,000,000.00
DEBIT   03/05/2022  Doug's Dugout Dogs          $33.27
END

grammar BankGrammar {
    token TOP             { <transaction>+ %% \n*                             }
    rule transaction      { <payment> <date> <description> <cost>             }
    token payment         { 'CREDIT' | 'DEBIT'                                }
    token date            { <digit-sequence>+ % '/'                           }
    token description     { [<-[\s]>+]+ % \s                                  }
    token cost            { <currency-sign> <currency-number>                 }
    token digit-sequence  { \d+                                               }
    token currency-sign   { '$'                                               }
    token currency-number { <digit-sequence>+ % <[.,]>                        }
}

class BankAction {
    method TOP($/)             { make $/<transaction>».made }
    method transaction($/)     { make $/<cost>.made  }
    method payment($/)         { make ~$/ }
    method date($/)            { make ~$/.subst('/', '-', :g) }
    method description($/)     { make ~$/ }
    method cost($/)            { 
        if ~$/<currency-sign> eq '$' {
            make ~$/<currency-number>.subst(',', '', :g).Num * 10
        } else {
            make ~$/<currency-number>.subst(',', '', :g).Num
        }
    }
    method digit-sequence($/)  { make ~$/ }
    method currency-sign($/)   { make ~$/ }
    method currency-number($/) { make ~$/ }
}

my $match = BankGrammar.parse($text, :actions(BankAction));
$match = BankGrammar.parse($text);
.say for $match;