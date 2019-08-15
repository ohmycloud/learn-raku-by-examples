use v6;

sub MAIN(Str :f($file)) {
	my @lines 	= $file.IO.lines;
	my @subjects 	= @lines.shift.words; # 表头
	my @datas	= [,] @lines.map: *.words[1 .. * - 1];
	my @names	= [,] @lines.map: *.words[0];

	my @row = @datas.map: -> @r { @r «/» [+] @r };
	my @col = [Z] ([Z] @datas).map: -> @c { @c «/» [+] @c };
	my @all = @datas.map: -> @r { @r «/» ([+] @datas.map(|*)) };

	print(@subjects, @names, @row);
	print(@subjects, @names, @col);
	print(@subjects, @names, @all);
}

sub print(@subjects, @names, @data) {
	say @subjects.join("\t");
	for (@names Z @data) -> @one {
		say @one.map(|*).join("\t");
	}
}

=finish
> $file = "input.txt"
input.txt
> :f($file)
f => input.txt
> :f("file")
f => file
所以在冒号对儿结构中, 冒号和第一个左括号之间的标识符作为键, 括号中的东西可以是一个表达式, 例如字符串, 子例程调用, 对象, 它们被解析后返回的结果作为键值。
