my Supply $supply = Supply.from-list(1..9);
my Supply $first = $supply.first(* % 2 == 0);

$first.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'quit'     }
);

#`(
let numbers = (1...9).publisher

numbers
  .first(where: { $0 % 2 == 0 })
  .sink(receiveCompletion: { print("Completed with: \($0)") },
        receiveValue: { print($0) })
  .store(in: &subscriptions)
)