
# produce 没有提供初始值
my @dailyGainLoss = (-10..10).pick(21);
my Supply $supply = Supply.from-list(@dailyGainLoss);
my Supply $produce = $supply.produce({ max(0, $^a + $^b) }).map(-> $value { $value + 50});
$produce.tap(
    &say,
    done => { say 'finished' },
    quit => {say 'quit'      }
);

#`(
// Swift scan
var dailyGainLoss: Int { .random(in: -10...10) }

let august2019 = (0..<22)
  .map { _ in dailyGainLoss }
  .publisher

august2019.scan(50) { latest, current in
  max(0, latest + current)
}
.sink(receiveValue: { _ in })
.store(in: &subscriptions)
)