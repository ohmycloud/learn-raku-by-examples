use Grammar::Debugger;
use Grammar::Tracer;

unit grammar Section::Grammar;

token TOP {
   ^  <section>+ %% <separator> $
}

token section {
    <line>+
}

token line {
   ^^ [\d+]+ %% ',' $$ \n
}

token separator {
    |  ^^ '=begin code' $$ \n
    |  ^^ '=end code' $$ \n*
}