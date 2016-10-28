use v6;

class B {
    has $.name;

    submethod BUILD(:$!name) {
        say "调用了 B 的 BUILD, 我叫 $!name"
    }
}

class C is B {
    has $.nickname;

    submethod BUILD(:$!nickname, :$name) {
        say "调用了 C 的 BUILD, 我叫 $!nickname, 我爸爸是 $name"
    }
    method new(:$nickname) {
        self.bless(nickname => 'Camelia', name => 'Lucy');
    }
}

my $c = C.new(nickname => 'HANMEIMEI');
