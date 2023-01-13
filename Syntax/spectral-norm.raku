sub A(\i, \j) {
  1e0 / ((i+j)*(i+j+1e0)/2e0 + i + 1e0)
}

sub Av(@v, \i) {
  [+] ( -> \j { A(i, j) *  @v[j] } for ^@v.elems );
}

sub Atv(@v, \i) {
  [+] ( -> \j { A(j, i) *  @v[j] } for ^@v.elems );
}

my $*SCHEDULER = ThreadPoolScheduler.new(:max_threads(4));
sub AtAv (@v) {
  my @u-promise = (^@v.elems).map(-> \i { start Av(@v, i) });
  my @u = await @u-promise;
  my @w-promise = (^@u.elems).map(-> \i { start Atv(@u, i) });
  await @w-promise;
}

multi sub MAIN(Int $n) {
  my @u := (1e0 xx $n).list;
  my @v;
  
  for ^10 {
    @v := AtAv(@u);
    @u := AtAv(@v);
  }

  my $a = start { [+] @u [Z*] @v };
  my $b = start { [+] @v [Z*] @v };
  printf "%.9f", ($a.result / $b.result).sqrt; 
  say now - INIT now;
}