use nqp;
nqp::stmts(
  (my num $start = nqp::time_n),
  (my int $n = 5000000),
  (my $c := nqp::list_i),
  (my int $t = 1),
  nqp::while(
    nqp::stmts(
      ($t = nqp::add_i($t, 2)),
      nqp::isle_i(nqp::mul_i($t, $t), $n)),
    nqp::if(
      nqp::isfalse(nqp::atpos_i($c, $t)),
      nqp::stmts(
        (my int $s = nqp::sub_i(nqp::mul_i($t, $t),nqp::mul_i($t,2))),
        nqp::while(
          nqp::stmts(
            ($s = nqp::add_i($s, nqp::mul_i($t,2))),
            nqp::isle_i($s, $n)),
          nqp::bindpos_i($c, $s, nqp::add_i(1, nqp::atpos_i($c, $s))))))),
  (my $p := nqp::list_i(2)),
  ($t = 3),
  nqp::while(
    nqp::stmts(
      ($t = nqp::add_i($t, 2)),
      nqp::isle_i($t, $n)),
    nqp::atpos_i($c,$t) || nqp::push_i($p, $t)),
  nqp::say(nqp::atpos_i($p, nqp::sub_i(nqp::elems($p),1))),
  nqp::say(nqp::sub_n(nqp::time_n, $start)))
