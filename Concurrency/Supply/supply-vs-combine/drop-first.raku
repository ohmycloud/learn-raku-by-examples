my Supply $supply = Supply.from-list(1..10);
my Supply $drop = $supply.skip(8);

$drop.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'quit'     }
);

#`(
let numbers = (1...10).publisher

numbers
  .dropFirst(8)
  .sink(receiveValue: { print($0) })
  .store(in: &subscriptions)
)