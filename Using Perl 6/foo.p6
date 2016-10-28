my $foo = 'Foo';
sub foo {
  my $bar = 'Bar';
  sub bar {
    say "$foo $bar";
  }
  &bar; # return the function
}
foo()(); #=> 'Foo Bar'
