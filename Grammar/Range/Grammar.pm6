use Grammar::Debugger;
use Grammar::Tracer;

unit grammar Range::Grammar;

token TOP {
   ^  <un-important-line>+ %% <section> $
}

token section {
   <begin> ~ <end> <line>+?
}

token un-important-line {
    ^^ \N+ )> \n*
}

token line {
    ^^ \N+ )> \n*
}

token begin {
    ^^ '=begin code' $$ \n*
}

token end {
    ^^ '=end code' $$ \n*
}