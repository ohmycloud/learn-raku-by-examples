sub postfix:<!>($n where $n > 0) {
   [*] 2..$n
}
say 5!;

constant fact = 1, [\*] 1..*;
say fact[5];
