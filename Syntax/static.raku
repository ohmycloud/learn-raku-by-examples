class Process {
    has Str $.name is rw;
    has Rat $.numInputRows is rw;
    has Rat $.inputRowsPerSecond is rw;
    has Rat $.processedRowsPerSecond is rw;
}

#| 使用方法 raku static.raku --file="application_1641455150029_0130_res.txt"
sub MAIN(:$file) {
    my @stream;
    for $file.IO.lines -> $line {
        next if $line.contains('NaN');
        next if !$line.contains('batchId');
        my ($name, $numInputRows, $inputRowsPerSecond, $processedRowsPerSecond) = $line.split(', ')[0,2,3,4];

        my $s = Process.new(
            name => $name.split('=')[1],
            numInputRows => $numInputRows.split('=')[1].Rat,
            inputRowsPerSecond => $inputRowsPerSecond.split('=')[1].Rat,
            processedRowsPerSecond => $processedRowsPerSecond.split('=')[1].Rat
        );
        @stream.append($s);
    }

    #| 统计 inputRowsPerSecond > processedRowsPerSecond 的百分比
    for @stream.classify(*.name).kv -> $k, $v {
        my $total = $v.elems;
        my $lags = 0;
        for |$v -> $p {
            $lags += 1 if $p.inputRowsPerSecond > $p.processedRowsPerSecond;
        }

        say $k, " ", $lags / $total;
    }
}

#`(
    在 onQueryProgress 函数中添加了如下统计日志:
    
        override def onQueryProgress(queryProgress: QueryProgressEvent): Unit = {
          val n=queryProgress.progress.name
          val z=queryProgress.progress.batchId
          val a=queryProgress.progress.numInputRows
          val b=queryProgress.progress.inputRowsPerSecond
          val c=queryProgress.progress.processedRowsPerSecond
          println(s"name=$n, batchId=$z, numInputRows=$a, inputRowsPerSecond=$b, processedRowsPerSecond=$c")
          if (queryProgress.progress.batchId % sparkConf.hisBatchInterval == 0) {
            HisMultiwanBroadcast.update(spark.sparkContext, blocking = true)
            hisMultiWarnData = HisMultiwanBroadcast.broadcast_instance.value
          }
        }
)