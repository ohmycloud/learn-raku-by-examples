# interval 方法返回一个新的按需供应
# 创建一个每隔 $interval 秒发射一个值的 supply
my Supply $supply = Supply.interval(0.1, 0.1).on-close({ say "Tap closed" });
my Tap $tap = $supply.tap(
    -> $v { say $v },
    done  => { say "Supply is done" },
    quit  => -> $ex { say "Supply finished with error $ex" },
);

sleep 2;
$tap.close;

$supply.tap( -> $v { say $v * $v } );
sleep 3;
