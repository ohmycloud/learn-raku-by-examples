my $words = "hey hey there! want to listen to mister mister ?".words;
my Supply $supply = Supply.from-list($words);
my Supply $unique = $supply.unique(:as(&lc));

$unique.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'quit' }
);

#`(
let words = "hey hey there! want to listen to mister mister ?"
  .components(separatedBy: " ")
  .publisher

words
  .removeDuplicates()
  .sink(receiveValue: { print($0) })
  .store(in: &subscriptions)
)