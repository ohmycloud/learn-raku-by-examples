use Term::ReadKey;

react {
    whenever key-pressed(:!echo) -> $k {
        .ord.say given $k;
    }
}
