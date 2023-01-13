for 1..20 {
    say $_;
    
    if $_ == 10  {
        say $_/0;
    }

    CATCH {
        default {
            say 'zero';
        }
    }
}