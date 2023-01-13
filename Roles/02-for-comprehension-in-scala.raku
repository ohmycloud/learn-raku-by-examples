#`[
case class Event(name: String, start: Int, end: Int)

def validateName(name: String): Option[String] =
  if (name.size > 0) Some(name) else None

def validateEnd(end: Int): Option[Int] =
  if (end < 3000) Some(end) else None

def validateStart(start: Int, end: Int): Option[Int] =
  if (start <= end) Some(start) else None

def parse(name: String, start: Int, end: Int): Option[Event] = for {
  validName <- validateName(name)
  validEnd <- validateEnd(end)
  validStart <- validateStart(start, end)
} yield Event(validName, validStart, validEnd)

parse("Apollo Program", 1961, 1972) // Some(Event("Apollo Program", 1961, 1972)))
parse("", 1939, 1945)               // None
]

role Things {                   #a utility Role for both flavours of Some

    method gist {
        "Some[{$.v.^name}]"     #
    }                           # .gist and .raku are used by .say and .Str
                                # methods ... so we override them to make nice
    method raku {               # output
        "Some[{$.v.^name}]"
    }

    method Str {             
        ~$.v                    # ~ is the Str concatenate operator, when used
    }                           # as a prefix it coerces its argument to (Str)

    method Numeric {
        +$.v                    # ~ is the addition operator, when used as a
    }                           # prefix it coerces its argument to (Num)
}

role None {}                    # roles are cool labels

role Some[::T] does Things {    # a parameterized role with a type capture
    has T $.v is required;      # using the type capture for a public attr

    multi method new( $v ) {    # ensure that the value is defined
        die "Died with undefined value" without $v;
        self.new: :$v
    }
}

role Some does Things {         # role are multis (Some[Int].new and Some.new)
    has $.s is required;        # require the attr ... if absent, fail
    has $.v;
    
    multi method new( ::T $v ) {   # use the type capture in a signature
        die "Died with undefined value" without $v; 
        self.new: s => Some[(T)].new(:$v)
    }   

    submethod TWEAK {           # late stage constructor alias $.v to $.v
        $!v := $!s.v            # for the Some Things role
    }   
}

subset Option of Any where Some|None;

my Option $opt;
$opt = Some.new(7);
#$opt = None;
given $opt {
    when Some {
        say "Got {.v}";
    }
    when None {
        say "Got nothing";
    }
}


class Event {
    has Str $.name;
    has Int $.start;
    has Int $.end;
}

sub validate-name(Str $name ) {
    if ($name.chars > 0) {
        Some.new($name) 
    } else { 
        None
    }    
}

sub validate-end(Int $end ) {
    if ($end < 3000) {
        Some.new($end)
    } else {
        None
    }    
}

sub validate-start(Int $start, Int $end ) {
    if ($start <= $end) {
        Some.new($start)
    } else {
        None
    }    
}