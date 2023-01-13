multi fac($n where $n <= 1) { 1 }
multi fac($n) { $n * fac($n - 1) }
for ^1_000_000 {
    fac(5)
}