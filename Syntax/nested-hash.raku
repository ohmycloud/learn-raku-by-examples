#| https://stackoverflow.com/questions/69579882/how-to-map-over-the-list-of-map-and-add-them
my @input = [
  %{a => 1, b => 2, c => [%{x => 1, y => 2}, %{x => 2, y => 3}]},
  %{a => 3, b => 4, c => [%{x => 2, y => 3}, %{x => 2, y => 3}]},
  %{a => 5, b => 6, c => [%{x => 3, y => 4}, %{x => 3, y => 4}]}
];

# 更新 hash
for @input -> $i {
    $i<c> = [+] $i<c>.flat>>.values.flat;
    dd $i
}