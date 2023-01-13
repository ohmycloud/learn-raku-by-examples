#`(
for {
    a <- List[Int](1, 2)
    b <- List[Int](10, 100)
    c <- List[Double](0.5, 0.7)
    d <- List[Int](3)
} yield (a * b * c + d).toString + "km"
# List(8.0km, 10.0km, 53.0km, 73.0km, 13.0km, 17.0km, 103.0km, 143.0km)
) 

.say for (List(1, 2) X* List(10, 100) X* List(0.5, 0.7)) >>+>> 3 >>~>> "km";

# Empty
.say for (List(1, 2) X* Empty X* List(0.5, 0.7)) >>+>> 3 >>~>> "km";