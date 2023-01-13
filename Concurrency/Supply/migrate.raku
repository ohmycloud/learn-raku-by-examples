my Supplier $stock-sources .= new;

sub watch-stock($symbol) {
    $stock-sources.emit: supply {
        say "Starting to watch $symbol";
        whenever Supply.interval(1) {
            emit "$symbol: 111." ~ 99.rand.Int;
        }
        CLOSE say "Lost interest in $symbol";
    }
}
 
$stock-sources.Supply.migrate.tap: *.say;
 
watch-stock('GOOG');
sleep 3;
watch-stock('AAPL');
sleep 3;