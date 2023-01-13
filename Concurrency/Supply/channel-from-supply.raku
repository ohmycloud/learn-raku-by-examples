use experimental :pack;

sub heart-msg(Str $msg, Str $device-id --> Blob) {
    my $heart-msg = $msg.substr(0, $msg.chars - 8);
    my $header-buf = pack("H*", $heart-msg);     # 从十六进字符串制创建 Buf
    my $device-id-buf = pack("L*", $device-id);  # 提取4个元素并将它们作为单个无符号整数返回

    $header-buf ~ $device-id-buf
}

sub deal-message(Str $msg, Str $device-id --> Blob) {
    # 消息正文由多个字段组成
    # 设备编号长度, 设备编号, pf 码, 数据长度, 绝对时间, 年、月、日、时、分、秒, 相对时间
    my $now    = DateTime.now();
    my $year   = $now.year;
    my $month  = $now.month;
    my $day    = $now.day;
    my $hour   = $now.hour;
    my $minute = $now.minute;
    my $second = $now.second.Int;
    my $check-number = 0;

    my $head-msg         = $msg.substr(0,4);           # [消息头] 从 0 位开始, 截取 4 位
    my $device-id-length = $msg.substr(4,2);           # [设备长度] 从 4 位开始, 截取 2 位
    my $pf-code          = $msg.substr(14, 2);         # [PF 码]从 16 位开始, 截取 2 位
    my $msg-length       = $msg.substr(16, 4);         # [数据长度] 从 16 位开始, 截取 4 位
    my $rel-time         = $msg.substr(20, 4);         # [相对时间] 从 20 位开始, 截取 4 位
    my $end-msg          = $msg.substr(38, $msg.chars - 38 - 2); #

    my $head-msg-buf      = pack("H*", $head-msg);
    my $device-id-len-buf = pack("H*", $device-id-length);
    my $device-id-buf     = pack("L*", $device-id);
    my $pf-code-buf       = pack("H*", $pf-code);
    my $msg-length-buf    = pack("H*", $msg-length);
    my $rel-time-buf      = pack("H*", $rel-time);
    my $year-buf          = pack("S*", $year);
    my $month-buf         = pack("C*", $month);
    my $day-buf           = pack("C*", $day);
    my $hour-buf          = pack("C*", $hour);
    my $minute-buf        = pack("C*", $minute);
    my $second-buf        = pack("C*", $second);
    my $end-msg-buf       = pack("H*", $end-msg);

    my @bufs = [$device-id-len-buf, $device-id-buf, $pf-code-buf, $msg-length-buf,
                $rel-time-buf, $year-buf, $month-buf, $day-buf, 
                $hour-buf, $minute-buf, $second-buf,$end-msg-buf];

    # 遍历字节数组, 使用校验数字对每个字节元素作校验
    for @bufs -> $byte {
        my $byte_sum = [+] $byte.contents;
        $check-number += $byte_sum;
    }

    $check-number = $check-number % 256;
    my $checked-msg-buf = pack("C*", $check-number);

    [~] $head-msg-buf, |@bufs, $checked-msg-buf
}

sub deal-data(Str $msg, Str $device-id --> Blob) {
    my $header = $msg.substr(0, 4);

    given $header {
        when '6868' {
            return deal-message($msg, $device-id);
        }
        when '7468' {
            return heart-msg($msg, $device-id);
        }
        default { return Buf.new }
    }
}


sub MAIN(
         :$host = '10.0.0.22',
         Int() :$port = 5000,
         Rat() :$interval = 0.001,
         :$file = 'data.txt',
         Int() :$device-num = 169) {
    my $conn = IO::Socket::INET.new(:$host, :$port);
    my @devices = "modelId.txt".IO.lines;
    my @promises;

    my $supplier = Supplier.new;
    my $supply = $supplier.Supply;
    my $channel = $supply.Channel;

    my $promise = start {
        react {
            whenever $channel -> $item {

            }
        }
    }

    my $f = lazy $file.IO.lines;
    my $iterator = $f.iterator;

    for @devices[159..$device-num] -> $device-id {
        @promises.push: start {
            react {
                whenever Supply.interval($interval) {
                    try {
                        my $line := $iterator.pull-one;

                        if $line =:= IterationEnd {
                            done;
                        } else {
                            my $blob = deal-data($line.chomp.split(/\s+/).tail, $device-id.Str);
                            #say $blob;
                            $conn.write($blob);
                        }
                    }

                    QUIT {
                        $conn.close;
                        say 'connecting closed';
                        default {
                            say .^name, '→ ', .Str;
                            say "handled in line $?LINE";
                        }
                    }
                    LAST {
                        say "Connection closed";
                        done;
                    }
                }
            }
        }
    }
    await @promises;
}