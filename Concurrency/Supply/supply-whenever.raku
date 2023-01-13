my Supplier $bread-supplier = Supplier.new;
my Supplier $vegetable-supplier = Supplier.new;

my Supply $supply = supply {
    # 花括号块儿后面的分号是可选的
    # 因为编译器会自动在花括号后面加上分号
    # The whenever keyword can be used in supply blocks or in react blocks.
    whenever $bread-supplier.Supply {
        emit("We've got bread: " ~ $_);
    }

    whenever $vegetable-supplier.Supply {
        emit("We've got a vegetable: " ~ $_);
    };
}

$supply.tap( -> $v { say "| $v |" });

$supply.on-close({say "Done"});

$vegetable-supplier.emit("Radish ");   # OUTPUT: «We've got a vegetable: Radish␤»
$bread-supplier.emit("Thick sliced "); # OUTPUT: «We've got bread: Thick sliced␤»
$vegetable-supplier.emit("Lettuce");  # OUTPUT: «We've got a vegetable: Lettuce␤»

# the main difference between a supply block and a react block is that the code in a react block runs where it appears in the code flow,
# whereas a supply block has to be tapped before it does anything.

# Please note that one should keep the code inside the whenever as small as possible, 
# as only one whenever block will be executed at any time. 
# One can use a start block inside the whenever block to run longer running code.