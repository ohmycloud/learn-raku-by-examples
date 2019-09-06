.perl.say given 'ABBBCDEEF'.split(/<!same>/);

.perl.say given 'ABBBCDEEF'.comb(/\w+ % <same>/);

.perl.say given 'ABBBCDEEF,'.comb(/.+ % <same>/);