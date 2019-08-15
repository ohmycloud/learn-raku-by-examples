use v6;


my @filenames = dir '.',  test => all(/\.md$/);

for @filenames -> $filePath {
    my $path = $filePath.path();
    $path ~~ s/.md//;

    my $date = DateTime.new(now);
    my $head = 
qq:heredoc 'EOT';
title:  $path.IO.basename()
date: $date
tags: Perl6
categories: Perl 6

---

<blockquote class="blockquote-center">我讨厌戴眼镜！</blockquote>

[TOC]

EOT

   my @content   = slurp $filePath;
   spurt($filePath.path, "$head\n@content[]");
}
