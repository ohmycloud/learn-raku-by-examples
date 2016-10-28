# Perl 6 supports writing a MAIN subroutine that is invoked at startup.
# Automatically maps arguments to parameters and generates usage instructions.


multi sub MAIN($number, Bool :$upto) {
    my @fib = 1, 1, *+* ... Inf;
    if $upto {
    say join ',', @fib[0 ..^ $number];
    }
    else {
        say @fib[$number - 1];
    }
}

multi sub MAIN(Str $name) { " " }

#`(
> perl6 MAIN.p6 10             
55                                                            
                                                              
> perl6 MAIN.p6 10 --upto      
Usage:                                                        
  MAIN.p6 [--upto] <number>                                   

# 可选参数写在必选参数前面                                                              
> perl6 MAIN.p6 --upto 10      
1,1,2,3,5,8,13,21,34,55 
)                                      
                                                              