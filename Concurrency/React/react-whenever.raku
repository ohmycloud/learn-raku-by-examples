# the main difference between a supply block and a react block is that the code in a react block runs where it appears in the code flow,
# whereas a supply block has to be tapped before it does anything.

# Another difference is that a supply block can be used without the whenever keyword, 
# but a react block requires at least one whenever to be of any real use.

react {
    whenever Supply.interval(⅓) -> $v {
        say $v;
        done() if $v == 4;
    }
}

# 从列表中创建按需供应
react {
    whenever Supply.from-list(1..10) -> $v {
        say $v;
    }
}
