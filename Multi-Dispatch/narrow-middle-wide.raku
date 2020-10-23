class Wide             { }
class Middle is Wide   { }
class Narrow is Middle { }

multi foo (Narrow:U)  { say "from Narrow" }
multi foo (Middle:U)  { say "from Middle" }
multi foo (Wide:U  )  { say "from Wide"   }

foo Narrow;
foo Middle;
foo Wide;
