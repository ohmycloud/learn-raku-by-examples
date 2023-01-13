sub infix:«|<<»(\a, \e) {
    Proxy.new(FETCH => method { |a, |e },
              STORE => method (\e) {})
              but role { method sink { a.push: e } };
}

my @a = 1,2,3;
@a |<< 4;
dd @a;
my @b = @a |<< 5;
dd @a, @b;