use v6;

class WordCount {
  has Int %.words is default(0);

  method new($string) {
    my Int %words;
    for $string.split(/\s+/) -> $word {
      %words{$word}++;
    }

    self.bless(:%words)
  }

  method gist {
    %.words.map({.value ~ " " ~ .key}).join("\n")
  }
}

my $word-count = WordCount.new('the boy jumped over the dog');
say $word-count;
