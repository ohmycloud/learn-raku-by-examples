sub escape ($str) {
    $_ = $str;
    # Puts a slash before non-alphanumeric characters
    s:g[<-alpha-digit>] = "\\$/";
}

say escape "foo#bar?"; # foo\#bar\?

{
    sub escape ($str) {
        $_ = $str;
        # Writes each non-alphanumeric character in its hexadecimal escape
        s:g|<-alpha-digit>| = "\\x[{ $/.base(16) }]";
    }

    say escape "foo#bar?"; # foo\x[23]bar\x[3F]
}

# Back to original escape function
say escape "foo#bar?"; # foo\#bar\?
