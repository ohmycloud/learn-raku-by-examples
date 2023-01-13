my Supplier $supplier1 = Supplier.new;
my Supplier $supplier2 = Supplier.new;

my Supply $publisher1 = $supplier1.Supply;
my Supply $publisher2 = $supplier2.Supply;
my Supply $merged     = $publisher1.merge($publisher2);

$merged.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'quit'     }
);

$supplier1.emit(1);
$supplier1.emit(2);
$supplier2.emit(3);
$supplier1.emit(4);
$supplier2.emit(5);

$supplier1.done;
$supplier2.done;

#`(
let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<Int, Never>()

publisher1
  .merge(with: publisher2)
  .sink(
    receiveCompletion: { _ in print("Completed") },
    receiveValue: { print($0) }
  )
  .store(in: &subscriptions)

publisher1.send(1)
publisher1.send(2)
publisher2.send(3)
publisher1.send(4)
publisher2.send(5)

publisher1.send(completion: .finished)
publisher2.send(completion: .finished)
)