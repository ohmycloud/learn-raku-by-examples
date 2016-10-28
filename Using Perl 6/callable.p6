use v6;

&function = sub { 
say 'hello';
};         # store subroutine in callable namespace
function();                      # call/run it

# # $coderef = sub { ... };          # store it in a scalar
# # $coderef($several, $parameter);  # run that code