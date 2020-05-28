use v6;
use MONKEY-SEE-NO-EVAL;

# -r=xxx -s=yyy -e=zzz -i=123
# usage: perl6 colon_in_signature.p6  -r="\d ** 3" -s="在木星" -i=2 1.txt 2.txt 3.txt
sub MAIN(Str :r(:$regex), Str :s(:$substr), Str :e(:$ext) = '.out', Int :i(:$ignore-line) = 0, *@files) {
    for @files -> $file {
        my $out = open $file ~ ".out", :w; # 写入文件

        for $file.IO.lines.kv -> $index, $line is copy {
            next if $index <= $ignore-line; # 忽略前 $ignore-line几行
            $line ~~ EVAL "s/" ~ $regex ~ "/" ~ $substr ~ "/"; # 根据正则表达式进行替换
            say $/;
            $out.say($line);
        }
        $out.close;
    }
}

# 查看本脚本的用法
# perl6 colon_in_signature.p6 --help
                                      
# Usage:
#  colon_in_signature.p6 [-r|--regex=<Str>] [-s|--substr=<Str>] [-e|--ext=<Str>] [-i|--ignore-line=<Int>] [<files> ...]

# 可以看出命令行选项有短名称(如 -r)和长名称(如 --regex)。
