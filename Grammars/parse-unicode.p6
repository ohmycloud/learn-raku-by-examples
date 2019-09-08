grammar G {


    proto rule TOP { * }

    rule TOP:sym<y>  { «<.sym>» }
    rule TOP:sym<✓>  { «<.sym>» }

}

say G.parse('y'); # ｢y｣
say G.parse('✓'); # Nil