class Coordinate {
    has $.x;
    has $.y;

    # 计算所在象限
    method quadrantOf(--> Int) {
        with self {
            when .x > 0 && .y > 0 { 1 }
            when .x < 0 && .y > 0 { 2 }
            when .x < 0 && .y < 0 { 3 }
            when .x > 0 && .y < 0 { 4 }
            -1
        }
    }

    # 重写 gist 方法, 个性化打印
    method gist() {
        return "The coordinate at ({self.x}, {self.y}) is in quadrant " ~ self.quadrantOf()
    }
}

my Supplier $supplier = Supplier.new;
my Supply $supply = $supplier.Supply;

$supply.tap({ say $_ });
$supplier.emit(Coordinate.new(x =>  10, y =>  8));
$supplier.emit(Coordinate.new(x => -10, y =>  8));
$supplier.emit(Coordinate.new(x => -10, y => -8));
$supplier.emit(Coordinate.new(x =>  10, y => -8));
$supplier.emit(Coordinate.new(x =>   0, y =>  5));
$supplier.emit(Coordinate.new(x =>   0, y =>  0));

#`(
// Swift
let publisher = PassthroughSubject<Coordinate, Never>()

publisher
  .map(\.x, \.y)
  .sink(receiveCompletion: { print($0) },
        receiveValue: {x, y in
          print("The coordinate at (\(x), \(y)) is in quadrant", quadrantOf(x: x, y: y))
        })
  .store(in: &subscriptions)

  publisher.send(Coordinate(x: 10, y: -8))
  publisher.send(Coordinate(x:  0, y:  5))
)