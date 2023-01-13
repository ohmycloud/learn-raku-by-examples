role BinaryTree[::T] {
    has BinaryTree[T] $.left;
    has BinaryTree[T] $.right;
    has T $.node;
 
    method visit-preorder(&cb) {
        cb $.node;
        for $.left, $.right -> $branch {
            $branch.visit-preorder(&cb) if defined $branch;
        }
    }
    method visit-postorder(&cb) {
        for $.left, $.right -> $branch {
            $branch.visit-postorder(&cb) if defined $branch;
        }
        cb $.node;
    }
    method new-from-list(::?CLASS:U: *@el) {
        my $middle-index = @el.elems div 2;
        my @left         = @el[0 .. $middle-index - 1];
        my $middle       = @el[$middle-index];
        my @right        = @el[$middle-index + 1 .. *];
        self.new(
            node    => $middle,
            left    => @left  ?? self.new-from-list(@left)  !! self,
            right   => @right ?? self.new-from-list(@right) !! self,
        );
    }
}
 
my $t = BinaryTree[Rat].new-from-list(4.5, 5.7, 6.8);
$t.visit-preorder(&say);    # OUTPUT: «5␤4␤6␤» 
$t.visit-postorder(&say);   # OUTPUT: «4␤6␤5␤» 