my @strings = ["a", "1.24", "3", "def", "45", "0.23"];
my Supply $supply = Supply.from-list(@strings);
my Supply $compact = $supply.map(-> $value {
  try { Num($value) }
  if $! { Empty } else { Num($value) }
 }).grep(Num);

$compact.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'done'     }
);

#`(
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
  .compactMap { Float($0) }
  .sink(receiveValue: {
    print($0)
  })
  .store(in: &subscriptions)
)