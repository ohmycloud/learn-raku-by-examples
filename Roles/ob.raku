role Observable { 
    has @!observers; 
     
    method subscribe($observer) { 
        push @!observers, $observer; 
        $observer 
    } 
     
    method unsubscribe($observer) { 
        @!observers .= grep({ $^o !=== $observer }); 
    } 
     
    method publish($obj) { 
        @!observers>>.handle($obj) 
    } 
} 

class ReadLineSource does Observable { 
    has $.fh; 
    method enterloop() { 
        loop { 
            self.publish($.fh.get()); 
        } 
    } 
} 

multi grep($matcher, Observable $ob) { 
    my class GrepSubscriber does Observable { 
        has $.matcher; 
        method handle($obj) { 
            if $obj ~~ $.matcher { 
                self.publish($obj); 
            } 
        } 
    } 
    $ob.subscribe(GrepSubscriber.new(:$matcher)) 
} 

my $src = ReadLineSource.new(fh => $*IN); 
$src 
    ==> grep(/^\d+$/) 
    ==> into my $nums; 
 
$nums 
    ==> grep(*.Int.is-prime) 
    ==> call(-> $p { say "That's prime!" }); 
 
$nums 
    ==> map(-> $n { 
            state $total += $n; 
            $total >= 100 ?? 'More than 100' !! () 
        }) 
    ==> first() 
    ==> call(-> $msg { say $msg }); 