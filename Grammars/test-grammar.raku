grammar MyGrammar {
    token TOP {
        ^ [ <comment> | <chunk> ]* $
    }

    token comment {
        '#' \N* \n
    }
    token chunk {
      ^^  (\S+) '=' (\S+) $$
    }
}

# 如何调试 Grammars
# try to parse the whole thing
say ?MyGrammar.parse("#a comment\nfoo = bar");            # False, 整体调试
# and now one by one
say so MyGrammar.parse("#a comment\n", :rule<comment>);   # True, 只单独调试 comment
say so MyGrammar.parse("foo = bar", :rule<chunk>);        # False, 只单独调试 chunk, 失败, 说明 chunk 不能匹配! 原因是空白符没有匹配