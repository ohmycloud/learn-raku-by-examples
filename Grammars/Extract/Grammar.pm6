use Grammar::Debugger;
use Grammar::Tracer;

unit grammar Extract::Grammar;

token TOP {
   ^  <section>+ %% <separator> $
}

token section {
    <line>+
}

token line {
   [ <!separator> . ]+
}

token separator {
    |  ^^ '=begin code' $$ \n
    |  ^^ '=end code' $$ \n*
}