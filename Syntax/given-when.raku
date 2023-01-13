for (:a, :!b, :c('str'), 12, :k('42'), :d(42), :e(55), '47', '55', 'foo') {
    when Pair & :value(Bool & :so)  { dd $_ }
    when Pair & :value(Bool & :!so) { dd $_ }
    when Pair & :value(Str)         { dd $_ }
    when Pair & :value(42)          { dd $_ }
    when Pair & :value(Int)         { dd $_ }
    when Str  & :Int & 47           { dd $_ }
    when Str                        { dd $_ }
    when Int                        { dd $_ }
}