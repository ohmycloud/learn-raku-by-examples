role OpinionatedBool {}
role AbsolutelyTrue does OpinionatedBool {}
role TotallyFalse does OpinionatedBool {}

my OpinionatedBool \bt = AbsolutelyTrue;

multi sub p(AbsolutelyTrue $b) {
    say 'True';
}
multi sub p(TotallyFalse $b) {
    say 'False';
}

# Trying it out:
p(bt); # prints True


# paramatered role
role RGBColour[Int \r, Int \g, Int \b] {
    has Int $.r = r;
    has Int $.g = g;
    has Int $.b = b; 
}

role HSLColour[Int \h, \s, \l] {
    has Int $.h = h;
    has Int $.s = s;
    has Int $.l = l;
}

my RGBColour \aquamarine = RGBColour[ 127, 255, 212].new;
given aquamarine {
    .r.say; 
}

role Coord[Int \x, Int \y] {
    has Int $.x = x;
    has Int $.y = y;
}

role XYCoord[Coord \xy] {
    has Coord $.xy = xy;
}

role Colour {}
role HSL[ HSLColour \hsl] does Colour {
    has HSLColour $.hsl = hsl;
}

role RGB[ RGBColour \rgb] does Colour {
    has RGBColour $.rgb = rgb;
}

role Pixel[ Colour \c, XYCoord \xy ] {
    has Colour $.c = c;
    has XYCoord $.xy = xy;
}


role List[::a] {}
role EmptyList[::a] does List[a] {}
role Cons[ ::a \elt, List \lst ] does List[a] {
    has $.elt = elt;
    has $.lst = lst;
}

# role EmptyList does List {}
# dd EmptyList;


role Matches {}
role UndefinedMatch does Matches {}
role Match[Str $str] does Matches {
    has Str $.match=$str;
}
role TaggedMatches[Str $tag, Matches @ms] does Matches {
    has Str $.tag = $tag;
    has Matches @.matches = @ms;
}

# my Matches @ms = Array[Matches].new(
#      Match["hello"].new,
#      TaggedMatches[
#          "Adjectives",
#          Array[Matches].new(
#              Match["brave"].new,
#              Match["new"].new) 
#              ].new,
#      Match["world"].new
#      );


role Either[::a,::b] { }
role Left[::a \l,::b] does Either[a,b] { 
    has a $.left = l;
}
role Right[::a,::b \r] does Either[a,b] { 
    has b $.right = r;
}

role BinaryTree[::Type] { }
role Node[::Type,  \l,  \r, \n] does BinaryTree[Type] { 
    has BinaryTree[Type] $.left = l;
    has BinaryTree[Type] $.right = r;
    has Type $.node = n;
}
role Tip[::Type] does BinaryTree[Type] { }

multi sub visit-preorder(Node \n,&cb) {
    cb n.node;
    for n.left, n.right -> \branch {
        visit-preorder(branch,&cb)
    }
}
multi sub visit-preorder(Tip,&cb) { }

multi sub visit-postorder(Node \n,&cb) {    
    for n.left, n.right -> \branch {
        visit-postorder(branch,&cb)
    }
    cb n.node;
}
multi sub visit-postorder(Tip,&cb) { }

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

my BinaryTree[Int] \t = new-from-list(Int,[4, 5, 6]);
visit-preorder(t,&say);    # OUTPUT: «5␤4␤6␤» 
visit-postorder(t,&say);   # OUTPUT: «4␤6␤5␤» 