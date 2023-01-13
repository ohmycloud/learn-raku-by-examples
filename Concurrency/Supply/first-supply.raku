my Supply $rand = supply { emit (rand × 100).floor for ^∞ };
my Supply $first-prime = $rand.first: *.is-prime;

# output the first prime from the endless random number supply $rand, 
# then the $first-prime supply reaches its end
$first-prime.tap(&say);
