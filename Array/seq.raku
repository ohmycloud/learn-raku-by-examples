my @a = 1, 2, 3;
my @b = <a b c>;
my \c = @a Z=> @b;
.say for c;
.say for c; # fails 
CATCH { default { put .^name, ': ', .Str } };