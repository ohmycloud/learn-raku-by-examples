my @work;
gather .take if /SCHEDULER/ for @work ==> map(* ~ "Done");

Q:w/50 53 23567 26102 21487 20889 20195 30721/.words».chr.join;

.say when /\d+/ given Q:w/50 53 23567 26102 21487 20889 20195 30721/;


say Q:w/50 53 23567 26102 21487 20889 20195 30721/.words».Int »+» 'Life, the Universe and Everything'.WHY;

say <92 95 23609 26144 21529 20931 20237 30763> »-» 'Life, the Universe and Everything'.WHY;

<92 95 23609 26144 21529 20931 20237 30763> »-» 'Life, the Universe and Everything'.WHY ==> map(*.chr);

'9295236092614421529209312023730763'.comb.rotor((0.3, 0.3, 2.6, 2.6, 2.6, 2.6, 2.6, 2.6).map: (10 * *.sin).Int);

'9295236092614421529209312023730763'.comb.rotor((|(0.3 xx 2), |(2.6 xx 6)).map: (10 * *.sin).Int)».join».chr.join;

'236092614421529209312023730763'.comb.rotor((0.3, 0.3, 2.6, 2.6, 2.6, 2.6, 2.6, 2.6).map: (10 * *.sin).Int)».join »-» 42 ==> map(*.chr);


.map(*.chr).join.say given '9295236092614421529209312023730763'.comb.rotor((|(0.3 xx 2),|(2.6 xx 6)).map: (10 * *.sin).Int)».join »-» 42;

say 2⁹⁶;

say 2⁰¹²³⁴⁵⁶⁷⁸⁹;