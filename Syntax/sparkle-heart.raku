say "💖".uniname; # SPARKLING HEART
say "💖".ords;    # (128150)
say "💖".codes;   # 1
say "\c[SPARKLING HEART]"; # 💖

my $b = Buf.new(240, 159, 146, 150);
say $b.decode('utf-8'); # 💖

say "\c[REPLACEMENT CHARACTER]"; # �