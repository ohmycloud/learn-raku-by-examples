use v6;
# 安全的密码
# 至少 8 位
# 包含大写字母、小写字母
# subset 不能使用 set(*.comb)  形式？

subset Password of Str where *.chars >=8 && any('A'..'Z','a'..'z') ∈ *.comb.Set;

sub passCheck(Password $password) {
    say "Password is Valid";
}

passCheck("abcdABCD");
