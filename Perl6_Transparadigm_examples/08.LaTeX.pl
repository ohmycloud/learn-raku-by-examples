#! /usr/bin/env perl6
use v6;

grammar LaTeX {

    rule document  { ^ <element>* $                          }
    rule element   { <command> | <literal>                   }
    rule command   { \\  <name=literal>  <options>?  <args>? }
    rule options   { '['  <option>* % ','  ']'               }
    rule args      { '{'  <element>*  '}'                    }

    token option   { <+lit_char-[,]>+                    }
    token literal  { <+lit_char>+                        }

    token lit_char { <-[\[\]$&%#_{}~^]-space>                }
}

my $example = q:to<END_OF_EXAMPLE>;

    \documentclass[a4paper,11pt]{article}
    \usepackage{latexsym}
    \author{D. Conway}
    \title{Parsing \LaTeX{}}
    \begin{document}
    \maketitle
    \tableofcontents
    \section{Description}
    ...is easy \footnote{But not \emph{necessarily} simple}.
    \end{document}

END_OF_EXAMPLE

say $example ~~ / <LaTeX::document> /;
