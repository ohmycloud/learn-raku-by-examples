for (1..4).race( batch => 1 ) {
    say "Doing $_";
    sleep 1;
}
say "Code took {now - INIT now} seconds to run";