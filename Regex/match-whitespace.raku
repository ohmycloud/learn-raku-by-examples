say 'x_x___x________' ~~ /
[
| 'x'
| '_' <!before [
        | $ 
        | '_' <?before $> 
        | '_' <?before ['_' <?before $>]>
        | '_' <?before ['_' <?before ['_' <?before $>]>]>
    ]>
]+
/;