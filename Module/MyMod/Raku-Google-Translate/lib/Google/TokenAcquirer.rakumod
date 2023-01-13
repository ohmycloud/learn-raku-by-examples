#! /usr/bin/env false

# https://pycoders-weekly-chinese.readthedocs.io/en/latest/issue3/static-modification-of-python-with-python-the-ast-module.html
# ast 部分需要修改 grammar, 这是 Perl 6 的拿手好戏
unit class Google::TokenAcquirer;

#| right shift with padding
sub rshift($val, $n) {
    return ($val % 0x100000000) ~> $n
}

class TokenAcquirer {
    has $.client;
    has $.tkk is rw = '0';
    has $.host is rw = 'translate.google.com';

    method update() {
        my $now = floor((DateTime.now().Instant.Num * 1000).Int / 3600000.0);
        return if self.tkk and int(self.tkk.split('.')[0]) == $now;

        my $r = self.session.get(self.host);

        # tkk:'429153.839646982'  say ~"tkk:'1234'".match(/tkk\: "'"  ((\d+)+ % '.') "'" /).[0]
        my $text = get self.host;
        my $rawtkk = $text.match(/tkk\: "'"  ((\d+)+ % '.') "'" /).[0];  # 获取 tkk 的值
        if $rawtkk == True {
            self.tkk = $rawtkk;
            return;
        }

        
        my $code = $text.search($r.text).group(1).subst('var', '');

        if $code {
            
        }
    }

    method lazy($value) {

    }

    method xr($a is rw, $b is rw) {
        my $size_b = $b.chars;
        my $c = 0;
        while $c < $size_b -2 {
            my $d = $b.comb[$c + 2];

            $d = 'a' <= $d ?? ord($d.comb[0]) - 87 !! int($d);
            $d = '+' == $b.comb[$c + 1] ?? rshift($a, $d) !! $a +< $d;
            $a = '+' == $b.comb[$c] ?? $a + $d & 4294967295 !! $a +^ $d;

            $c += 3;
        }
        return $a;

    }

    method acquire($text) {
        my $b = self.tkk != '0' ?? self.tkk !! '';
        my $d = $b.split('.');
        $b = $d.chars > 1 ?? int($d.comb[0]) !! 0;

        # assume a means char code array
        my @e = [];
        my $g = 0;
        my $size = $text.chars;
        for $text.comb.kv -> $i, $char {
            my $l = ord($char);
            # just append if $l is less than 128(ascii: DEL)
            if $l < 128 {
                @e.append: $l;
            } else {
                if $l < 2048 { # append calculated value if l is less than 2048
                    @e.append: $l +> 6 +| 192;
                } else { # append calculated value if l matches special condition
                    if ($l +& 64512 == 55296) and ($g + 1 < $size) and ord($text.comb[$g + 1]) +& 64512 == 56320 {
                        $g += 1;
                        $l = 65536 + (($l +& 1023) +< 10) + ord($text[$g]) +& 1023;
                        @e.append: $l +> 18 +| 240;
                        @e.append: $l +> 12 +& 63 +| 128;
                    } else {
                        @e.append: $l +> 12 +| 224;
                    }
                    @e.append: $l +> 6 +& 63 +| 128;
                }
                @e.append: $l +& 63 +| 128;
            }
        }
        my $a = $b;
        for @e.comb.kv -> $i, $value {
            $a += $value;
            $a = self.xr($a, '+-a^+6');
        }
        $a = self.xr($a, '+-3^+b+-f');
        $a ^= $d.chars > 1 ?? int($d.comb[1]) !! 0;
        $a = ($a +& 2147483647) + 2147483648 if $a < 0;
        $a %= 1000000; # int(1E6)

        return sprintf("%s.%s", $a, $a ^ $b);
    }

    method do($text) {
        self.update;
        return self.acquire($text);        
    }
}

=begin pod

=NAME    Google::TokenAcquirer
=AUTHOR  ohmycloud <ohmycloudy@gmail.com>
=VERSION 0.0.0

=head1 Synopsis

=head1 Description

=head1 Examples

=head1 See also

=end pod

# vim: ft=perl6 noet
