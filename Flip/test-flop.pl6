my @lines = gather {
  my @current;
  for $=finish.lines {
    if /^\d+ '、'/ fff /\s* <?before ^\d+ '、'>/ {
      # collect the values between matches
      push @current, .trim;
    } else {
      # take the next value between matches
      # don't bother if there wasn't any values matched
      if @current {
        # you must do something so that you aren't
        # returning the same instance of the array
        take @current.List;
        @current = ();
      }
    }
  }
}

.Str.say for @lines;

=finish
1、一见钟情，靠的也是出色的外貌

但凡一个人说“我不喜欢一见钟情式的故事”，多半代表——这位，对自己的外貌不自信。

2、想知道一个人的内心缺少什么

不看别的，就看其炫耀什么。想知道一个人自卑什么，不看别的，就看其掩饰什么。

3、从网络聊天习惯读懂一个人

原来喜欢用“……”和“。。。”的人心底大多比较柔软，没有坏心眼，同时也会反映出他她对待事情的优柔寡断，大部分会有选择恐惧症。。。

4、人脉交际8大心理定律