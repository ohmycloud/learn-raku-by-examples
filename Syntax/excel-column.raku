#!/usr/bin/env perl6

#`(
Write a script that accepts a number and returns the Excel Column Name it represents and vice-versa.

Excel columns start at A and increase lexicographically using the 26 letters of the English alphabet, A..Z. After Z, the columns pick up an extra “digit”, going from AA, AB, etc., which could (in theory) continue to an arbitrary number of digits. In practice, Excel sheets are limited to 16,384 columns.

Example
Input Number: 28
Output: AB

Input Column Name: AD
Output: 30
)

my @columns = 'A', 'A'.succ ... *;
my @indices = 0 .. 16383;

multi sub excel-column(Int $input where 1 <= * <= 16384) {
    say @columns[$input - 1];
}

multi sub excel-column(Str $input) {
    say @columns[0..16384].antipairs.hash.{$input}.Int + 1;
}

excel-column(28);
excel-column('AD');