given 42 {
    when Int {
	say "Int";
	succeed "Found";
	say "Never this";
    }

    when 42 {say 42}
    default {say "duno"}
 }
