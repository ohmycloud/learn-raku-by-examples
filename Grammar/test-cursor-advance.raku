grammar Foo {
    token TOP { <test> <alpha>* }
    method test { 
        '123123' ~~ /<digit> ** 3 /
    }
}

say Foo.parse: 'abcabc'