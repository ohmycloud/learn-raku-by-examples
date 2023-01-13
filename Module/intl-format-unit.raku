use Intl::Format::Unit;

say format-unit 0,        :unit<length-meter>; # 0 m
say format-unit 1234,     :unit<length-meter>; # 53,425.21 m
say format-unit 53425.21, :unit<length-meter>; # 1,234 m