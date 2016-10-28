use v6;

class Cat {
    has $.fullname;
    has $.nickname;

    submethod BUILD(:$!fullname, :$!nickname) {
        say "造了一只猫, 它的全名是 $!fullname, 它的昵称是 $!nickname";
    }
}

# 造了一只猫, 它的全名是 Camelia, 它的昵称是 Rakudo Star
Cat.new(fullname => 'Camelia', nickname => 'Rakudo Star');

# class C {
#     has $.size;
#     method new($x) {
#         self.bless(*, size => 2 * $x);
#     }
# }
#
# say C.new(3).size;      # prints 6
