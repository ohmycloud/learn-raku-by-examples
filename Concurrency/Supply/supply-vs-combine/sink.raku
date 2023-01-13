my Supply $s = Supply.from-list('A' .. 'E');

$s.tap(
    &say,
    done => { say "finished" },
    quit => { say "quit"     }
);

#`(
// 类似于 Swift 中的 sink
["A", "B", "C", "D", "E"].publisher
  .sink(receiveCompletion: { print($0) },
        receiveValue: { print($0) })
  .store(in: &subscriptions)
)