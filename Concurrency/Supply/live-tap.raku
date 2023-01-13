my Supplier $supplier = Supplier.new;   # Supplier factory
my Supply $supply = $supplier.Supply;   # A live Supply, $supply 是一个 Supply 对象

$supply.tap(-> $v { say "-$v-" });      # 订阅
$supplier.emit(42);                     # Will cause the tap to output "-42-"

#for 1..Inf {
#    $supplier.emit($_); # new value are emitted on the Supplier
#}