use v6;
# Unpacking Arrays
# Can extract elements from within an array, to do FP-style list processing

sub head([$head, *@tail]) {
    return $head;
}

sub tail([$head, *@tail]) {
    return @tail;
}

my @example = 1,2,3,4;
say head(@example);
say tail(@example);
