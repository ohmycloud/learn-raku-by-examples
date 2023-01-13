use v6;

role BinaryTree[::Type] { }
role Node[::Type,  \l,  \r, \n] does BinaryTree[Type] { 
    has BinaryTree[Type] $.left = l;
    has BinaryTree[Type] $.right = r;
    has Type $.node = n;
}
role Tip[::Type] does BinaryTree[Type] { 
}

sub mkNode ($T,$l,$r,$v) {
    Node[$T,$l,$r,$v].new;
} 

sub mkTip ($T) {
    Tip[$T];
} 
my BinaryTree[Int] $t1= Tip[Int];#[Int];

my BinaryTree[Int] $t2=
    mkNode(Int,
        mkNode(Int,
            mkNode(Int,
                Tip[Int],
                Tip[Int],
                22),
            Tip[Int],
            55),
        mkNode(Int,
            mkNode(Int,
                Tip[Int],
                Tip[Int],
                33),
            Tip[Int],
            11),
        44
    );

say $t2;

multi sub new-from-list(::T,[]) {
    Tip[Int].new    
}
multi sub new-from-list(::T,\el) {
    my \middle-index = el.elems div 2;
    my \left         = el[0 .. middle-index - 1];
    my \middle       = el[middle-index];
    my \right        = el[middle-index + 1 .. *];
    
    Node[T,
        new-from-list(T,left),
        new-from-list(T,right),
        middle            
    ].new;
}

multi sub visit-preorder(Node \n,&cb) {
    cb n.node;
    for n.left, n.right -> \branch {
        visit-preorder(branch,&cb);# if defined $branch;
    }
}
multi sub visit-preorder(Tip,&cb) {
   # cb T;
}


multi sub visit-postorder(Node \n,&cb) {    
    for n.left, n.right ->\branch {
        visit-postorder(branch,&cb);# if defined $branch;
    }
    cb n.node;
}
multi sub visit-postorder(Tip,&cb) {
   # cb T;
}


my BinaryTree[Int] \t = new-from-list(Int,[4, 5, 6]);

say t.raku;

visit-preorder(t,&say);
visit-postorder(t,&say);
