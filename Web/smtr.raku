#!/opt/rakudo-star-2018.01/bin/perl6
# ------------------------------------------------------------
# 功能(Function)：
# 1.本字典使用百度翻译通用API进行翻译,支持28种语言互译，覆盖中
#	、英、日、韩、西、法、泰、阿、俄、葡、德、意、荷、芬、丹等
#	；支持28种语言。末尾附支持语言列表及其简写。默认英文到中文
#	，若需更改，更改48～51行$from及$to变量即可。
# 2.启动后将读取本程序所在目录下名"dict.txt"文件，"dict.txt"里
#	存放百度翻译开发者的信息，包含注册后百度免费给予的APP ID和
#	密钥。
# ------------------------------------------------------------
# 优缺点：
#	优点：短小精简，可翻译语言种类多
#	缺点：翻译总量有字符限制，若当月翻译字符数≤2百万，当月免费
#		  ；若超过2百万字符，按照49元/百万字符支付当月全部翻译
#		  字符数费用。（不过一般查查单词差不多够用了）
# ------------------------------------------------------------
# 使用方法:
# 1.在本程序同目录下创建"dict.txt"文件，然后到百度翻译免费注册
#	开发者，然后将管理控制台里开发者信息一栏里的申请信息复制到
#	此"dict.txt"文件。
# 2.启动本程序，将会提供翻译提示符">",在翻译提示符后输入待翻译
#	内容，回车后本程序将返回百度翻译结果。
# 3.输入“exit”或“quit”或[Ctrl]D退出程序。
# ------------------------------------------------------------
# 程序名: smtr.pl6 (SmallTranslation)
# 版本: V1.02.0
# 作者：Dw*Joker
# 联系方式：
#	邮箱: daemon.love@foxmail.com
#	QQ：1191896806
# 
#                  希望大家多提意见使程序变得更好*^_^*
# 
# 写于: 2018年2月21日
# ------------------------------------------------------------

# ------------------------------------------------------------
# 需先用zef安装Digst::MD5和HTTP::UserAgent模块,在终端键入命令:
# zef install Digest::MD5
# zef install HTTP::UserAgent
# ------------------------------------------------------------

# 使用模块(Modules)
use v6.c;
use Digest::MD5;
use HTTP::UserAgent;

# 翻译源语言
my $from = 'en';
# 翻译目标语言
my $to = 'zh';

# 百度翻译API地址
my $URL = 'http://api.fanyi.baidu.com/api/trans/vip/translate?';

# 从本目录下的"dict.txt"读取开发者信息
my @DATA = slurp("dict.txt").split("\n");
my $APPID = @DATA[0] if @DATA[0] ~~ s/APP\sID.(\d+)/$0/;
my $Key = @DATA[1] if @DATA[1] ~~ s/密钥.(.+)/$0/;

unless $APPID.defined {
	say "APPID没有设置!";
	exit(2);
}
unless $Key.defined {
	say "密钥没有设置!";
	exit(3);
}

# 翻译循环
try {
	my $query = prompt "To exit type 'exit' or 'quit' or '^D'\n>" ;
	while ( $query.defined )  && ($query ne 'exit' | 'quit') {
		say Translate($query,$from,$to,$APPID,$Key);
		$query = prompt ">";
	}
	CATCH {
		when X::AdHoc {say "AdHoc Error";}
		when X::IO {say "IO Error";}
		when X::OS {say "OS Error";}
		default {say "Other Error";}
	}
}

# 翻译子函数，接受5个参数
# $QUERY为待翻译字符串，$FROM为翻译源语言，默认英语，$TO为翻译目标语言
# 默认中文，$APPID 和 $KEY 为百度发放的开发者信息，默认从dict.txt读取
# 返回值为翻译完成后的字符串
sub Translate ($QUERY,$FROM='en',$TO='zh',$APPID?,$KEY?) returns Str
{
	my $Appid;
	with $APPID {
		$Appid = $APPID;
	}
	my $Key;
	with $KEY {
		$Key = $KEY ;
	}
	my $Salt = map({$_.split('.')},rand*10**10).[0][0];
	my $String = $Appid ~ $QUERY ~ $Salt ~ $Key;
	my $Md5string = Digest::MD5.new.md5_hex($String);
	my $url = $URL ~ "q=$QUERY" ~ "&from=$FROM" ~ "&to=$TO" ~ "&appid=$Appid" ~ "&salt=$Salt" ~ "&sign=$Md5string";
	
	my $ua = HTTP::UserAgent.new;
	$ua.timeout = 10;
	
	my $response = $ua.get($url);
	
	my Str $result ;
	if $response.is-success {
	#	say $response.content;
		if $response.content ~~ m/\"dst\"\:\"([\\u\w+]+)\"/ {
			my $text = "$0" ;
			my @array = $text.split('\u');
			for @array -> $item is rw {
				$result ~= $item.chr if $item ~~ s/(\d+)/0x$0/ ;
			}
		}
	} else {
		die "Error with status code " ~ $response.status-line;
	}
	return $result;
}

# 源语言语种不确定时可设置为auto，目标语言语种不可设置为auto。
# 语言简写	名称
#	auto	自动检测
#	zh		中文
#	en		英语
#	yue		粤语
#	wyw		文言文
#	jp		日语
#	kor		韩语
#	fra		法语
#	spa		西班牙语
#	th		泰语
#	ara		阿拉伯语
#	ru		俄语
#	pt		葡萄牙语
#	de		德语
#	it		意大利语
#	el		希腊语
#	nl		荷兰语
#	pl		波兰语
#	bul		保加利亚语
#	est		爱沙尼亚语
#	dan		丹麦语
#	fin		芬兰语
#	cs		捷克语
#	rom		罗马尼亚语
#	slo		斯洛文尼亚语
#	swe		瑞典语
#	hu		匈牙利语
#	cht		繁体中文
#	vie		越南语
