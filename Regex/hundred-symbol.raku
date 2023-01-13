 my $ingredients = 'milk, flour, eggs and sugar';
 # prints "milk, flour, eggs", 如果 say $/[0] 只会打印 || , 因为[] 是非捕获组!
 $ingredients ~~ m/ [\w+]+ % [\,\s*] / && say "|$/|";
# |milk, flour, eggs|
# 这里 \w+ 匹配一个单词，并且 [\w+]+ % [\,\s*]  匹配至少一个单词，并且单词之间用逗号和任意数量的空白分隔。
 '1,2,3' ~~ / \d+ % ',' / && say "|$/|";
# |1,2,3|
# % 必须要跟在量词后面，否则报错。
# 在 [\w+] 里面 [ ] 是非捕获组
