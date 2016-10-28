use v6;

my @a=1,2,3;
my $s='Escape Plan';
my %h='Rakudo'=>'Star','STD'=>'Larry';

# 捕获就是一系列实参的签名
my $capture = \(@a,$s,%h);      # creating a capture, "\" was free since there are no references anymore
say(|$capture).perl;            # flatten into argument list (hash like context)
# ||$cap;                       # flatten into semicolon list (array like context)
