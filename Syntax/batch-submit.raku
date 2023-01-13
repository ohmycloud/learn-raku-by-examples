for Date.new('2019-11-10') ... Date.new('2020-09-23') -> $d {
    my $proc = Proc::Async.new: "spark-submit", "--executor-memory", "6g", "--driver-memory", "4g", "consistency_app.py", "$d", 1, "v1";
        react {
            whenever $proc.start {
                say "Proc finished: exitcode=", .exitcode,  "signal=", .signal;
                spurt 'result.txt', "$d is faild\n", :append if .exitcode == 1;
                done;
            }
        }
}