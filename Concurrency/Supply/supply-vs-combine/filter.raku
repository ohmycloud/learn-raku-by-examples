
my Supply $supply = Supply.from-list(1..10);
my Supply $grep = $supply.grep(-> $value { $value % 3 == 0 });

$grep.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'quit'     }
);

say '-' x 40;

# 工厂方法的写法
my Supplier $supplier = Supplier.new;
my Supply $all = $supplier.Supply;
my Supply $multiple-of-three = $all.grep(* % 3 == 0);

$multiple-of-three.tap(
    &say,
    done => { say 'finished' },
    quit => { say 'done'     }
);

$supplier.emit($_) for 1..10;
$supplier.done;

#`(
let numbers = (1...10).publisher

numbers
  .filter { $0.isMultiple(of: 3) }
  .sink(receiveValue: { n in
    print("\(n) is a multiple of 3!")
  })
  .store(in: &subscriptions)
)