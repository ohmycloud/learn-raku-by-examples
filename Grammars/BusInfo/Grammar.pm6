#use Grammar::Debugger;
#use Grammar::Tracer;

unit grammar BusInfo::Grammar;

token TOP {
    ^ <network>+ $
}

token network {
    <header> <colon-line>+
}

token header {
    '*-network' \N* \n
}

token colon-line {
   \s+ <field> ': ' <value> \n*
}

token field {
    [\w+]+ %% ' '
}

token value {
    \N+
}