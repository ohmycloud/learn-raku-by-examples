my Supply $supply = Supply.from-list('A' .. 'E').rotor(2 , :partial);

$supply.tap(
    &say,
    done => { say "finished" },
    quit => { say "quit"     }
);

#`(
["A", "B", "C", "D", "E"].publisher
.collect(2)
.sink(receiveCompletion: { print($0) },
      receiveValue: { print($0) })
.store(in: &subscriptions)
)