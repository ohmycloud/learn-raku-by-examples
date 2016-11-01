# 如何使用 Grammar 分割一个有规律的文本文件? 首先这个文本有规律, 但是却是多行的:
#`(
[28/04/2015 12:32] Title1

content line 1
content line 2
content line 3
content line 4
content line 5

balabala
balabala

[28/04/2015 12:16] Title2

content line 6
balabala
content line 7

[27/04/2015 17:30] ​Title3

content line 8
content line 9
content line 10

#我想将这样的文档分为独立的. 比如上面这个例子, 我想将他们分成3个独立的文本, 每个文本包含: [时间] Title 以及下面的 content lines.
#实际的文件会有上千个, 最终输出的文本的名字最好是按照括号里面的时间来。
)


#use Grammar::Tracer;
#use Grammar::Debugger;

grammar StructedText {
    token TOP { ^ <entry>+ $ }
    token entry {
        <head> \s*   # 每一项有一个标题
        <line>+ \s*  # 每个标题下面有很多行
    }
    
    token head     { '[' <datetime> ']' \s+ <title> }
    token datetime {  <filedate> \s+  <filetime> }
    token filedate { [\d+]+ % '/' }
    token filetime { [\d+]+ % ':' }
    token title    { \N+          }
    token line  {
        [
		    <!head>       # 前面不是 head 标题
            .             # 点号匹配换行符
        ]+
    }
}
# Method 'ast' not found for invocant of class 'Str'
# make ~$<filetime>.subst(':', '-', :g).ast;

class StructedText::Actions {
    method line    ($/) { $/.make: ~$/                            }
    method filedate($/) { $/.make: ~$/.subst(rx/<[:/]>/, '-', :g) }
    method head    ($/) { $/.make: ~$/.subst(rx/<[:/]>/, '-', :g) }
    method entry   ($/) { make $<head>.ast => $<line>».made;      }
    method TOP     ($/) { $/.make: $<entry>».ast;                 }    
}
my $actions = StructedText::Actions.new;
my $parsed = StructedText.parsefile('sample.txt', :$actions).made;
if $parsed {
    for @$parsed -> $e {
        my $filename = ~$e.key.match(/'[' <( <-[\[\]]>+ )> ']'/)  ~ ".txt";
        my $fh = open $filename, :w; 
        $fh.say: ~$e.key;
        for $e.value -> $v {
            $fh.say: $v;
        }
        $fh.close;
        say "生成文件 $filename ";       
    }
    
}
