#!/usr/bin/env perl6

say '³⁄₄₇'.ords;        # (179 8260 8324 8327)
say "\c[179]";          # ³
say "\c[179]".uniname;  # SUPERSCRIPT THREE
say "\c[8260]";         # ⁄
say "\c[8260]".uniname; # FRACTION SLASH

# if we want 5/49 fraction
say "\c[8309,8260,8324,8329]";
say '⁵⁄₄₉'.ords; # (8309 8260 8324 8329)
say (⁵⁄₄₉).WHAT;