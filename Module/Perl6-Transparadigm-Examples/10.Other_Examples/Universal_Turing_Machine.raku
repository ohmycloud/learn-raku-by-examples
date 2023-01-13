#! /usr/bin/env perl6
use v6;

sub infix:<?=>  ($lval is rw, $rval) { $lval  = $rval if defined $rval; }
sub infix:<?+=> ($lval is rw, $rval) { $lval += $rval if defined $rval; }

sub UTM(:$state is copy, :%rules!, :$head is copy = 0, :@tape = ['_' xx ($head+1)], :$halt = '') {

    loop {
        say "$state: @tape.kv.map({$^at==$head ?? "[$^cell]" !! " $^cell "})";

        return if $state eq $halt;

        given (%rules{ $state }{ @tape[$head] // '_' } // fail) {
            @tape[$head] ?= .<write>;
            $state       ?= .<state>;
            $head       ?+= .<move>;
        }

        if $head < 0 { $head = 0; unshift @tape, '_'; }
        push @tape, '_'  while $head >= @tape;
    }
}

my %rules = (
    S1 => {  _  => {               state=> 'HT',              },
             1  => { write=> '_',  state=> 'S2',    move=> +1 },
          }, 
    S2 => {  _  => {               state=> 'S3',    move=> +1 },
             1  => {                                move=> +1 },
          }, 
    S3 => {  _  => { write=>  1,   state=> 'S4',    move=> -1 },
             1  => {                                move=> +1 },
          }, 
    S4 => {  _  => {               state=> 'S5',    move=> -1 },
             1  => {                                move=> -1 },
          }, 
    S5 => {  _  => { write=>  1,   state=> 'S1',    move=> +1 },
             1  => {                                move=> -1 },
          },
);

UTM(:state<S1>, :%rules, :tape[1,1,1,1], :halt<HT>);

