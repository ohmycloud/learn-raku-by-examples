#!/usr/bin/env perl6

Supply.interval(0.3).map(* ** 2).tap(*.say);
sleep 2;