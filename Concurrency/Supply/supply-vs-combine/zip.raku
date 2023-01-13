my Supplier $supplier1 = Supplier.new;
my Supplier $supplier2 = Supplier.new;

my Supply $publisher1 = $supplier1.Supply;
my Supply $publisher2 = $supplier2.Supply;
my Supply $zipped     = $publisher1.zip($publisher2);

$zipped.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'quit'     }
);

$supplier1.emit(1);
$supplier1.emit(2);
$supplier2.emit("a");
$supplier2.emit("b");
$supplier1.emit(3);
$supplier2.emit("c");

$supplier1.done;
$supplier2.done;

#`(
let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

publisher1
  .zip(publisher2)
  .sink(
    receiveCompletion: { _ in print("Completed") },
    receiveValue: { print("P1: \($0), P2: \($1)") }
  )
  .store(in: &subscriptions)

publisher1.send(1)
publisher1.send(2)
publisher2.send("a")
publisher2.send("b")
publisher1.send(3)
publisher2.send("c")
publisher2.send("d")

publisher1.send(completion: .finished)
publisher2.send(completion: .finished)
)