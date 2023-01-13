my Supply $supply = Supply.from-list: [72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33];
my $flat-supply = $supply.map(&decode).reduce({$^a ~ $^b });

$flat-supply.tap(
        &say,
        done => { say 'finished' },
        quit => { say 'quit'     }
);

sub decode($x) {
  chr($x)
}

#`(
// swift flatMap
func decode(_ codes: [Int]) -> AnyPublisher<String, Never> {
  Just(
    codes
      .compactMap { code in
        guard (32...255).contains(code) else { return nil }
        return String(UnicodeScalar(code) ?? " ")
      }.joined()
  ).eraseToAnyPublisher()
}

[72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
.publisher
.collect()
.flatMap(decode)
.sink(receiveValue: { print($0) })
.store(in: &subscriptions)
)