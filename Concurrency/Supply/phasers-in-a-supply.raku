my Supplier $supplier = Supplier.new();
my Supply $supply = $supplier.Supply;

# 订阅
$supply.tap: -> $v { say $v };

for 1..5 {
    $supplier.emit($_);
}

react {
    whenever $supply {
        LAST { say 'Job is done.' }
        QUIT { say "App Error: "  }
    }
}