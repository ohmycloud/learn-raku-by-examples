#!/usr/bin/env perl6

#| https://stackoverflow.com/questions/50578740/mixing-roles-into-callables
my &random-f = -> $arg  { "Just $arg" };

say random-f("boo");

role Argable {
    method argh(&self:) {
        self( "argh" );
    }
}

&random-f does Argable;

say &random-f.argh;