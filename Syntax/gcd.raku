my &find_gcd = &[gcd] ∘ *.bounds ∘ &minmax;

#&find_gcd = gcd ∘ collect ∘ extrema;

say find_gcd 2, 5, 6, 9, 10; # 2
say find_gcd 7, 5, 6, 8, 3;  # 1
say find_gcd 3, 3;           # 3