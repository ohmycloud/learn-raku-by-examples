my Supply $supply  = Supply.from-list(1..3);
my Supply $doubled = $supply.map: -> $value { $value * 2 };

$doubled.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'quit'     }
);

#`(
[1,2,3].publisher
  .map { $0 * 2 }
  .sink(receiveCompletion: { print($0) },
        receiveValue: { print($0) })
  .store(in: &subscriptions)
)

