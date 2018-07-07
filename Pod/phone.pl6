
use v6;

my @a = qw/中兴 华为 iPhone 酷派 联想 小米 一加 索尼 三星 HTC 金立 诺基亚 摩托罗拉 LG 黑莓 多普达 夏普 天宇 TCL 360 乐视 VIVO OPPO/;

for $=finish.lines -> $line {
  my $phone = $line.split(':')[1];

  if $phone  ~~ /:i @a / {
    say $line ~ (~$/).uc;
  } else {
    say $line;
  }

}

=finish
vivo X5V:vivo X5V:
DOOV L5M:朵唯DOOV L5M:
GT-I9508:三星盖乐世S4:
OPPO R7sPlus:OPPO R7sPlus:
SM-N9300:三星盖乐世Note 7 Duos:
YLT X6-小R9:永隆通:
DOOV L8 Plus:朵唯L8 Plus:
PLK-TL00:华为荣耀7:
M7:HTC One (M7):
SCL-TL00:华为荣耀4A:
GT-I9508V:三星盖乐世S4:
ZTE Q7:中兴Q7:
Coolpad 8702:酷派8702:
PLK-CL00:华为荣耀7:
R2010:OPPO R2010:
ZUK Z2121:联想ZUK Z2 Pro:
HUAWEI NXT-CL00:华为Mate 8:
HUAWEI TAG-CL00:华为畅享5S:
MI-4LTE:小米手机4:
V9180:中兴V5:
Coolpad 8712:酷派8712:
SM-G5308W:三星 Grand Prime:
CUN-TL00:华为荣耀畅玩5:
SM-N9005:三星盖乐世Note 3:
Coolpad 8297-T01:酷派大神F1 Plus:
SAMSUNG-SM-G920A:三星盖乐世S6:
Lenovo X3c50:联想乐檬X3:
F100A:金立F100:
CUN-AL00:华为荣耀畅玩5:
A51:OPPO A51:
PP5600:PPTV 手机:
1107:OPPO 1107:
Meitu M4:美图M4:
CHE-TL00:华为荣耀畅玩4X:
XT1570:摩托罗拉X STYLE:
Google Nexus6:谷歌Nexus 6:
C6603:索尼 Xperia Z:
JXD:金星JXD手机:
2014812:红米2:
ZTE Q806T:中兴醉享Q806T:
OPPO A33:OPPO A33:
X9007:OPPO Find 7:
SM-G8508S:三星盖乐世Alpha:
vivo Y35A:vivo Y35A:
SM-N910L:三星盖乐世NOTE 4:
2013023:红米手机:
OPPO R9km:OPPO R9km:
NX523J_V1:努比亚Z11MAX:
SC-04E:三星盖乐世S4:
YEPEN:誉品手机:
SM-G9208:三星盖乐世S6:
UOOGOU-T8:优购 T8:
HUAWEI RIO-TL00:华为G7 Plus:
SM-G9308:三星盖乐世S7:
SM-E7009:三星盖乐世E7:
NEM-TL00:华为荣耀畅玩5C:
GN8003:金立GN8003:
XT1635-03:摩托罗拉Moto Z Play:
SM-A5108:三星盖乐世A5:
ZTE BA910:中兴A910:
SM-J5108:三星盖乐世J5:
HUAWEI VNS-L31:华为 P9 lite:
Lenovo A828t:联想A828t:
SM-A9000:三星盖乐世A9:
msm8909:未知:
Coolpad 8722V:酷派8722V:
SM-G7108V:三星盖乐世Grand 2:
NX510J:努比亚NX510J:
DOOV L7:朵唯DOOV L7:
NX508J:努比亚Z9:
3007:OPPO 3007:
A31t:OPPO A31t:
XM50t:索尼 XPERIA T2:
SM-G5108Q:三星盖乐世Core Max:
Coolpad T2-C01:酷派锋尚Pro:
V008-N5:碟米手机:
Lenovo K910:联想K910:
SM-G9006W:三星盖乐世S5:
vivo Y31A:vivo Y31A:
ZTE G719C:中兴青漾3:
SM-T705C:三星盖乐世Tab S:
S3:三星盖乐世S III:
M823:中国移动N1 max:
SM-A7009:三星盖乐世A7:
SM-T805C:三星盖乐世TAB S:
KIW-CL00:华为荣耀畅玩5X:
SM-G7200:三星盖乐世Grand 3:
M570C:魅族M570C:
MI 2:小米2:
Y685Q:魅蓝手机:
LG-D857:LG G3:
HUAWEI MLA-TL00:华为G9 Plus:
HUAWEI G700-U00:华为Ascend G700:
SM-G6100:三星盖乐世On7:
Pixel:谷歌Pixel:
Coolpad 8675-HD:酷派大神F2:
HUAWEI B199:华为麦芒:
ZTE G720T:中兴星星2号:
Lenovo A7600-m:联想黄金斗士S8:
P9:华为P9:
Nibiru H1:火星1号:
SM-N7508V:三星盖乐世Note3 Lite:
GN9010:金立:
SM-G7509:三星盖乐世MEGA 2:
STV100-1:黑莓手机:
OPPO A30:OPPO A30:
Moto G:摩托罗拉 Moto G:
OPPO A57:OPPO A57:
GS57-6:德国金阶Gigaset ME pro:
LG-H815:LG G4:
ONE E1000:一加Mini:
HTC D830u:HTC Desire:
R7Plust:OPPO R7Plus:
ramos R9:蓝魔R9:
Coolpad 8297W:酷派大神F1:
1603-A02:奇酷F4S:
MI 4C:小米4C:
PRO 6s:魅族 Pro 6s:
Lenovo A788t:联想A788t:
Lenovo A368t:联想A368t:
XT1058:摩托罗拉Moto X XT1058:
F100:金立手机:
2013022:红米手机:
S8-701w:华为荣耀平板:
SCH-I959:三星盖乐世S4:
HUAWEI A199:华为A199:
vivo X9Plus:vivo X9Plus:
SM-N9002:三星盖乐世Note 3 Duos:
R833T:OPPO R833T:
SM-J3109:三星盖乐世J3:
SM-G920S:三星盖乐世S6:
SM-N910U:三星盖乐世Note 4:
SM-G930F:三星盖乐世S7:
M51w:索尼Xperia Z1 炫彩版:
SM-T311:三星盖乐世Tab 3:
GT-I8552:三星盖乐世Win Duos:
Coolpad 9190_T00:酷派9190:
R8107:OPPO R5:
SM-G7106:三星盖乐世Grand 2:
LA2-SN:红辣椒任性版:
Lenovo K30-T:联想乐檬K3:
HTC M8St:HTC One E8:
R7005:OPPO R3:
XL39h:索尼 Xperia Z Ultra:
HTC D820t:HTC Desire:
vivo X3S W:vivo X3S:
X800+:乐视1pro:
Coolpad 8690_T00:酷派:
HTC D820us:HTC Desire 820us:
N5209:OPPO N3:
SM-G5309W:三星盖乐世GRAND PRIME:
EVA-L29:华为P9:
T07:长虹手机:
SD4930UR:亚马逊 Fire Phone:
ZTE BV0701:中兴小鲜4:
HUAWEI MT2-L05:华为Mate 2:
Lenovo K10e70:联想K10e70:
HLA NX-PLUS:红辣椒 NX-PLUS:
ZTE C880S:中兴小鲜3:
HUAWEI MT2-L01:华为MT2:
HUAWEI MLA-AL00:华为麦芒5:
vivo X5Pro L:vivo X5Pro L:
ZTE BV0720:中兴Blade A2:
HUAWEI NXT-L29:华为 Mate 8:
Meitu M4s:美图M4s:
Lenovo TAB 2 A10-70F:联想Tab 2:
TCL i806:TCL手机:
SM-G9009W:三星盖乐世S5 Duos:
SAMSUNG-SM-G935A:三星盖乐世S7 Edge:
Lenovo X2-TO:联想VIBE X2:
HUAWEI G6-T00:华为G6:
Coolpad 7620L:酷派K1:
LA2-S:红辣椒任性版:
HUAWEI U9508:华为荣耀2:
GO N2:青橙GO N2:
V188:金立V188:
M3X:魅族 M3x:
HUAWEI TIT-CL00:华为畅享5:
Lenovo B8080-F:联想 Yoga Tablet 10 HD+:
SM-A7108:三星盖乐世A7:
1501-M02:360F4:
SM-G9008W:三星盖乐世S5:
vivo Xplay3S:vivo Xplay3S:
Coolpad A8-930:酷派锋尚MAX:
NX512J:努比亚Z9 Max:
SM-G5500:三星盖乐世On5 Duos:
vivo X5Max L:vivo X5Max L:
Lenovo K32c36:联想乐檬3:
GT-I9200:三星盖乐世Mega:
SM-N900V:三星盖乐世Note 3:
DOOV A6:朵唯A6:
ZTE BA610T:中兴远航4:
OPPO A59s:OPPO A59s:
L39h:索尼 Xperia Z1:
Q03:欧沃:
SUGAR F7:SUGAR F7:
Lenovo P1c72:联通 Vibe P1 Pro:
X80h(FB5M):台电平板:
SM-G9009D:三星盖乐世S5:
M681C:魅族M681C:
L50u:索尼Xperia Z2:
MI 4:小米4:
SHV-E250L:三星盖乐世Note 2:
R6007:OPPO R6007:
koobee M3:酷比M3:
RunboF1:魅蓝Note:
vivo V3:vivo V3:
Lenovo P1c58:联想Vibe P1 Pro:
MI 2A:小米2A:
LG-D802:LG G2:
OPPO R7t:OPPO R7t:
Laaboo V9:蓝博兴:
X80 Plus(H6C3):台电X80 Plus:
vivo X3V:vivo X3V:
HTC M8Sd:HTC One E8:
HUAWEI G6-C00:华为Ascend G6:
ZTE BV0710T:中兴V7 MAX:
SM-A5009:三星盖乐世A5 Duos:
R5:OPPO R5:
vivo X5Max+:vivo X5Max+:
KNT-TL10:华为荣耀V8:
vivo Y913:vivo Y913:
vivo Y55A:vivo Y55A:
vivo X7L:vivo Y55A:
M685U:魅族M685U:
vivo Y37:vivo Y37:
L55u:索尼Xperia Z3:
GN8001:金立手机:
UOOGOU F2:优购 F2:
G620S-UL00:华为荣耀畅玩4:
1501-A02:360F4:
E7:三星盖乐世E7:
HUAWEI Y635-CL00:华为Y635-CL00:
V188S:金立V188S:
TCL M2U:TCL M2U:
R8200:OPPO R1C:
GS53-6:德国金阶Gigaset ME pure:
MI PAD:小米平板2:
SM-G7508Q:三星盖乐世Mega 2:
HUAWEI RIO-L02:华为G7 Plus:
M623C:中国移动A1:
GT-S7278:三星盖乐世Ace 3:
Le X625:乐视2 Pro:
R819T:OPPO R819T:
lephone W9+:乐丰lephone W9+:
BLN-TL10:华为荣耀 6X:
vivo Y923:vivo Y923:
ZTE N939Sc:中兴威武3:
CAM-TL00H:华为荣耀畅玩5A:
SM-G930K:三星盖乐世S7:
DOOV L3:朵唯倾城L3:
vivo Y35:vivo Y35:
m1:锤子M1:
R7007:OPPO R3:
GN3001:金立手机:
DXA001:来米手机:
T1-A21w:华为荣耀平板note:
Coolpad 7251:酷派:
SM-A700YD:三星盖乐世A7 Duos:
GT-I9300I:三星盖乐世S3 Neo Duos:
SM-N7507:三星盖乐世Note 3 Neo:
Lenovo A708t:联想A708t:
X5-Pro:vivo X5Pro:
GEM-703LT:华为荣耀X2:
HTC D820mt:HTC Desire:
vivo Y18L:vivo Y18L:
ivvi i3-01:赵丽颖签名版ivvi:
HUAWEI C8816:华为C8816:
lephone T6+V:乐丰lephone T6+V:
C106-9:酷派:
8298-A01:酷派全魔王:
GN9002:金立:
R829T:OPPO R1 R829T:
TCL P728M:TCL:
HTC E9pw:HTC One E9+ E9pw:
H30-C00:华为荣耀3C:
Le X822:乐视Max:
Hisense M20-T:海信M20-T:
G620-L75:华为G620:
XT1079:摩托罗拉Moto g(XT1079):
P1:华为P1:
G750-T01:荣耀3X畅玩版:
GT-I9502:三星盖乐世S4:
ONE E1001:一加手机X:
HUAWEI CRR-CL20:华为Mate S:
X909T:Oppo Find 5:
Coolpad 8297_4.4:酷派:
Lenovo A938t:联想黄金斗士Note8:
vivo X1St:vivo X1St:
ZTE BA611C:中兴远航4S:
HM NOTE 1W:红米Note1:
Lenovo Z90-3:联想大拍VIBE Shot:
Le X621:乐视2:
GN9011:金立:
U7:有糖U7手机:
SM-E7000:三星盖乐世E7:
Lenovo TB-8703N:联想TAB3 8 Plus:
K-Touch K1:天语K1:
ZTE BV0730:中兴Blade A2 Plus:
SM-W2015:三星盖乐世Golden 2:
HUAWEI G660-L075:华为G660:
BTV-W09:华为MadiaPad M3:
ZTE A880:中兴A880:
SM-T700:三星盖乐世Tab S:
GUOMI:果米手机:
HUAWEI P6-T00:华为Ascend P6:
ASUS_Z00ADB:华硕ASUS_Z00ADB:
Lenovo A5800-D:联想A5800-D:
TCL M2M:TCL 么么哒:
TCL P588L:TCL乐玩:
LA-X4:小辣椒手机:
EVA-L09:华为P9:
L-01F:LG G2:
SS119:马卡龙时尚手机:
MI PAD 2:小米平板2:
8681-A01:奇酷青春版:
vivo Y37A:vivo Y37A:
vivo X6Plus L:vivo X6Plus L:
Lenovo S938t:联想S938t:
R815T:OPPO R815T:
Pioneer C1:先锋手机C1:
HUAWEI P7-L05:华为Ascend P7:
LG-H848:LGG5 SE:
GN152:金立:
Coolpad 8971:酷派8971:
SHV31:Sharp SHV31:
SM-N9106W:三星盖乐世NOTE 4:
Lenovo K30-W:联想乐檬K3:
Coolpad Y75:酷派锋尚:
MP1503:美图手机:
OptimusG Pro2:LG G Pro 2:
Coolpad 8297D:酷派大神F1 青春版:
Wetuan Q 9:长虹Q9:
VOTO GT7:维图手机:
HUAWEI RIO-CL00:华为麦芒4:
HTC D820u:HTC Desire 820 dual sim:
4G:未知:
LG-K220:LG X Power:
3005:OPPO 3005:
D5803:索尼 Xperia Z3 Compact:
R8007:OPPO R1S:
HUAWEI MT7-L09:华为Ascend Mate7:
HL8015506:神舟灵雅:
HLA NOTE1-L:小辣椒:
Lenovo A5860:联想A5860:
ZTE N909:中兴N909:
E2363:索尼 Xperia M4 Aqua Dual:
XT1077:摩托罗拉g:
vivo X5Pro V:vivo X5Pro V:
K-Touch C5:天语K-Touch C5:
GT-N5100:三星盖乐世Note 8:
Samsung Note3:三星Note 3:
GT-N7108:三星盖乐世Note II:
M836:中国移动N2:
HTC D820ts:HTC Desire 820s:
Letv X620:乐视2:
L50w:索尼 Xperia Z2:
SM-T805:三星 Tab S:
IM-A910L:泛泰手机:
GT-I8558:三星盖乐世Win:
NX601J:努比亚X6:
vivo X6L:vivo X6L:
GN9005:金立:
Lenovo A3800-d:联想A3800d:
SM-G920R7:三星盖乐世S6:
GT-N7102:三星盖乐世Note 2 Duos:
ZTE BA510:中兴BA510:
SCH-N719:三星盖乐世Note 2:
JIAYU-S3:佳域S3:
HTC D816v:HTC Desire:
KOPO L8:酷珀手机:
Coolpad 9190L:酷派S6:
GN9008:金立:
N5110:三星盖乐世Note 8:
SM-J3119:三星盖乐世J3 Pro:
InFocus M560:富可视:
V182:金立:
MI 1S:小米1S:
F103S:金立:
MotoE2(4G-LTE):摩托罗拉Moto E:
Coolpad A8-831:酷派锋尚MAX:
Coolpad8198T:酷派8198T:
KOPO L9:酷珀手机:
HONOR H30-L01M:华为荣耀3C:
GN8002S:金立:
ZTE G720C:中兴G720C:
G0215D:格力G0215D:
Y685C:魅族Y685C:
M578C:魅族M578C:
BTV-DL09:华为MediaPad M3:
SCL-CL00:华为荣耀4A:
Lenovo S820:联想S820:
U707T:OPPO U707T U2S:
GN5001:金立金钢:
vivo Y66S:vivo Y66S:
ZTE N939St:中兴威武3:
HM 1SC:红米1S:
HUAWEI G610-T00:华为G610-T00:
Li:未知:
Coolpad A8-931:酷派A8-931:
ZTE A2015:中兴AXON天机:
Coolpad 8729:酷派8729:
HTC M8e:HTC One M8 Eye:
HUAWEI G610-C00:华为G610-C00:
SM-G9209:三星盖乐世S6:
Bestsonny_LT989:华森Best sonny:
F1f:OPPO F1f:
EVA-L19:华为P9:
GN9012:金立:
F3213:索尼 Xperia XA Ultra:
MI 2C:小米2C:
SM-G928S:三星盖乐世S6 edge+:
Hol-U10:荣耀3C畅玩版:
vivo Y66:vivo Y66:
SM-J3110:三星盖乐世J3:
Hasee W50 T2:神舟灵雅:
G01111:格力G01111:
W909:金立天鉴W909:
ZUK Z2151:联想ZUK Z2151:
R827T:OPPO R827T:
Nexus 7:谷歌Nexus 7:
Coolpad Y80D:酷派锋尚Y80D:
VIE-L29:华为P9 Plus:
L36h:索尼L36h:
Lenovo K30-E:联想K30-E:
L8s:大桔手机:
LG-D852:LG G3:
S6:三星盖乐世S6:
M040:魅族M040:
N960:中兴N960:
HTC 802w:HTC One M7:
SAMSUNG-SM-N900A:三星盖乐世Note 3:
MediaPad 7 Youth:华为MediaPad 7 Youth:
unknown:未知:
SM-A800IZ:三星盖乐世A8:
Lenovo K920:联想K920:
SM-G9198:三星SM-G9198:
NCE-AL00:华为畅享6:
SM-G5108:三星盖乐世Core Max:
Moto G (4):摩托罗拉Moto G4:
GT-I9152P:三星盖乐世Mega Plus:
vivo V3Max L:vivo V3Max L:
XT1031:摩托罗拉Moto G:
H60-L21:华为荣耀6:
Coolpad Y82-520:酷派锋尚2:
SM-G925I:三星盖乐世S6 Edge:
TCL_S725T:TCL:
KING 7S:PPTV King 7S:
XT1254:摩托罗拉DROID Turbo:
Coolpad 8730L:酷派8730L:
SM-W2016:三星SM-W2016:
vivo X5Max V:vivo X5Max V:
M636:中国移动A2:
OPPO R9sk:OPPO R9s:
SCH-I939I:三星盖乐世S III Neo+:
R8205:OPPO R1C:
Lenovo Z90-7:联想Z90-7:
vivo X510t:vivo X510t:
HTC One E9 dual sim:HTC One E9 dual sim:
vivo Y613F:vivo Y613F:
SM-G900V:三星盖乐世S5:
GT2:维图手机:
GT-I9082:三星Grand Duos:
KOOMII-K8:酷米手机:
NTS-AL00:华为荣耀Magic:
SCL23:三星盖乐世S5:
Coolpad 9976D:酷派大神1S:
SHV-E250K:三星盖乐世Note 2:
SM-G3609:三星盖乐世Core Prime Duos:
Y19:vivo Y19:
LAVA_A3:LAVA A3:
Coolpad 5951:酷派5951:
NX40X:努比亚NX40X:
ZTE Q302C:中兴Q302C:
HUAWEI M2-801W:华为M2:
A0001:一加:
A1001:一加:
2014821:红米2:
6607:OPPO 6607:
8681-M02:奇酷青春版:
831C:HTC:
1505-A01:360手机N4S:
1505-A02:360手机N4S:
1509-A00:360奇酷Q5 plus:
1501_M02:360F4:
2014011:红米1s:
2014811:红米2:
2014821:红米2:
2014501:红米1s:
8676-A01:酷派大神Note3:
Coolpad 8675-A:酷派大神F2:
8692-A00:酷派:
8298-M02:酷派:
8692-M02:酷派:
EVA-DL00:华为P9:
ATH-AL00:华为荣耀7i:
EVA-AL10:华为P9:
FRD-AL00:华为荣耀8:
EVA-TL00:华为P9:
Che1-CL20:华为荣耀畅玩4X:
ALE-UL00:华为P8:
CHE-TL00H:为荣耀畅玩4X:
CHM-UL00:华为荣耀畅玩4C:
CAM-UL00:华为荣耀畅玩5A:
Che2-UL00:华为荣耀畅玩4X:
Che2-TL00:华为荣耀畅玩4X:
Che1-CL10:华为荣耀畅玩4X:
EDI-AL10:华为荣耀Note8:
CAM-AL00:荣耀畅玩5A:
FRD-AL10:华为荣耀8:
HM NOTE 1LTE:红米Note1:
HM NOTE 1S:红米Note 1S:
EVA-AL00:华为P9:
H60-L02:华为荣耀6:
HUAWEI CRR-UL00:华为Mate S:
HUAWEI GRA-UL00:华为P8:
HUAWEI GRA-UL10:华为P8:
HUAWEI GRA-TL00:华为P8:
H60-L11:华为荣耀6:
HUAWEI GRA-CL00:华为P8:
HUAWEI CAZ-AL10:华为nova:
HTC D816t:HTC:
GN5001S:金立:
HUAWEI ALE-CL00:华为P8:
HUAWEI C199:华为麦芒:
HUAWEI G7-UL20:华为Ascend G7:
ALE-TL00:华为P8:
HUAWEI M2-803L:华为平板:
HUAWEI C8816D:华为:
HM NOTE 1LTETD:红米Note1:
HM 2A:小米红米2A:
Hisense F20T:海信:
HM NOTE 1TD:红米Note1:
HTC A9w:HTC One:
HUAWEI C8818:华为C8818:
HUAWEI CRR-CL00:华为Mate s:
H30-T00:华为荣耀3C:
HUAWEI CRR-UL20:华为Mate s:
HUAWEI G7-TL00:华为Ascend G7:
HUAWEI G750-T00:华为荣耀3X:
HUAWEI C199s:华为麦芒3S:
HTC6435LVW:HTC:
HTC M8d:HTC One M8:
HTC D816w:HTC Desire 816:
HTC M9pw:HTC One M9+:
HTC M9w:HTC One M9:
HTC One_M8:HTC One M8:
HTC D728w:HTC Desire 728:
G621-TL00:华为荣耀畅玩4:
Coolpad 8675:酷派大神F2:
CM810:纽曼:
CHM-TL00H:华为荣耀畅玩4C:
Coolpad 8675-W00:酷派大神F2:
Coolpad SK1-01:酷派:
Coolpad7295+:酷派:
Coolpad Y72-921:酷派:
Coolpad Y71-511:酷派:
CHM-TL00:华为荣耀畅玩4C:
Che2-TL00M:华为荣耀畅玩4C:
ASUS_T00J:华硕:
ASUS_T00G:华硕:
A31:OPPO A31:
ASUS_Z010DA:华硕:
BBQ-AL20:步步高:
C8817D:华为荣耀畅玩4:
C106:酷派:
D189-AL00:华为荣耀8:
D5833:索尼:
GN3003:金立:
GN151:金立:
GEM-703L:华为荣耀X2:
GN9004:金立:
GT-I9128:三星盖乐世Grand:
GT-I9500:三星盖乐世S4:
GT-I9158V:三星盖乐世Mega Plus:
GT-I9158:三星盖乐世MEGA:
FRD-DL00:华为荣耀8:
DIG-AL00:华为畅享6S:
dazen X7:酷派大神X7:
D6503:索尼:
8676-M01:酷派大神Note3:
F103:金立:
GT-N7100:三星盖乐世Note II:
