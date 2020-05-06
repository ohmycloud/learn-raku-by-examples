# cursor doesn't have to reach the end of string to succeed
# That is, it doesn't have to match the whole string
# subparse always returns a Match object
# method subparse($target, :$rule = 'TOP', Capture() :$args = \(),  Mu :$actions = Mu, *%opt)

grammar RepeatChar {
    token start($character) { $character+ }
}

say RepeatChar.subparse('bbbabb', :rule('start'), :args(\('b'))); # ｢bbb｣
say RepeatChar.parse('bbbabb', :rule('start'), :args(\('b')));    # Nil
say RepeatChar.subparse('bbbabb', :rule('start'), :args(\('a'))); # #<failed match>
say RepeatChar.subparse('bbbabb', :rule('start'), :args(\('a')), :pos(3)); # ｢a｣
