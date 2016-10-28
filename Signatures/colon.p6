sub rectangle(:$width!, :$height!, :$char = 'X') {
    say $char x $width for ^$height;
}

rectangle char => 'o', width => 8, height => 4;
rectangle :width(20), :height<5>;
