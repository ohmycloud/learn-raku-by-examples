use v6;

my $date = DateTime.new(now);
my $filename = "start.md";
my $head =
qq:heredoc 'EOT';
title:  Perl6
date: $date
tags: Perl6
categories: Perl 6

---

<blockquote class="blockquote-center">我讨厌戴眼镜！</blockquote>

EOT

my $fh = open $filename, :w;
$fh.say($head);
$fh.close;
