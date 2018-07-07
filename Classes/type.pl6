class C {
    multi method f(::?CLASS:U:){say "class method"}
    multi method f(::?CLASS:D:){say "object method"}
}
C.f;       # says class method
C.new.f;   # says object method
