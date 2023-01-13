my $p1 = Promise.new;
say $p1.status;         # OUTPUT: «Planned␤» 
$p1.keep('Result');
say $p1.status;         # OUTPUT: «Kept␤» 
say $p1.result;         # OUTPUT: «Result␤» 
                        # (since it has been kept, a result is available!) 
say $p1.result;         # again


my $p2 = Promise.new;
$p2.break('oh no');
say $p2.status;         # OUTPUT: «Broken␤» 
say $p2.result;         # dies, because the promise has been broken 
CATCH { default { say .^name, ': ', .Str } };
# OUTPUT: «X::AdHoc+{X::Promise::Broken}: oh no␤» 