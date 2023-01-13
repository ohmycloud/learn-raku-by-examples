my $input = q:to/END/;
CREDIT    04062020    PayPal transfer    $4.99
CREDIT    04032020    Payroll            $69.73
DEBIT     04022020    ACH transfer       $38.25
DEBIT     03242020    IRS tax payment    $52249.98
END

class Kind { has $.kind is rw}
class TDate { 
    has $.day is rw;
    has $.month is rw;
    has $.year is rw;
}
class Amount {
    has $.amount is rw;
}

grammar TransactionGrammar {
    token TOP             { <transaction>+ %% \n*                             }
    rule  transaction     { <kind> <date> <description> <amount>              }
    token kind            { 'CREDIT' | 'DEBIT'                                }
    token date            { <digit-sequence>+ % '/'                           }
    token description     { [<-[\s]>+]+ % \s                                  }
    token amount          { <currency-sign> <currency-number>                 }
    token digit-sequence  { \d+                                               }
    token currency-sign   { '$'                                               }
    token currency-number { <digit-sequence>+ % '.'                           }
}

class TransactionAction {
    method TOP($/)             { make $/<transaction>».made }
    method transaction($/)     { 
        my %h = kind => $<kind>.made,
             date => $<date>.made,
             description => $<description>.made,
             cost => $<amount>.made;
        make %h;     
    }
    method kind($/)            { make Kind.new(kind => ~$/) }
    method date($m)            {
        my $match = (~$m).match(/(\d ** 2)(\d ** 2)(\d ** 4)/);
        #dd $m;
        #dd $/;
        make $m: TDate.new(day => ~$match[0], month => ~$match[1], year => ~$match[2]);
    }
    method description($/)     { make ~$/ }
    method amount($/)          {
        make Amount.new(amount => +$<currency-number> * 100);
    }
    method digit-sequence($/)  { make ~$/ }
    method currency-sign($/)   { make ~$/ }
    method currency-number($/) { make ~$/ }
}

my $match = TransactionGrammar.parse($input, :actions(TransactionAction)).made;
.say for $match<>;
# .<date>.year.say for $match<>;
.<cost>.amount.say for $match<>;

# {cost => Amount.new(amount => 499.0), date => TDate.new(day => "04", month => "06", year => "2020"), description => PayPal transfer, kind => Kind.new(kind => "CREDIT")}
# {cost => Amount.new(amount => 6973.0), date => TDate.new(day => "04", month => "03", year => "2020"), description => Payroll, kind => Kind.new(kind => "CREDIT")}
# {cost => Amount.new(amount => 3825.0), date => TDate.new(day => "04", month => "02", year => "2020"), description => ACH transfer, kind => Kind.new(kind => "DEBIT")}
# {cost => Amount.new(amount => 5224998.0), date => TDate.new(day => "03", month => "24", year => "2020"), description => IRS tax kind, kind => Kind.new(kind => "DEBIT")}
# 499
# 6973
# 3825
# 5224998

# 4.99
# 69.73
# 38.25
# 52249.98