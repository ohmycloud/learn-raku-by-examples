use v6;

my %grade = "example.txt".IO.lines.map: {
    m:s/^(\w+) (<[A..F]><[+-]>?)$/
        or die "Can't parse line '$_'";

    ~$0 => ~$1;
}

say %grade;

say "Zsófia's grade: %grade<Zsófia>";
say "List of students with a failing grade:";

say " " ~%grade.grep(*.value ge 'F')».key.join(" ");

say "Distribution of grades by letter:";
say "  {.key}: {+.value} student{"s" if .value != 1}"
    for %grade.classify(*.value.comb[0]).sort(*.key);
