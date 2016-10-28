multi sub MAIN('send', $filename) {
 ...
}
multi sub MAIN('fetch', $filename) {
 ...
}
multi sub MAIN('compare', $file1, $file2) {
 ...
}

#`(
... 是 yadayadayada 占位符
> perl6 "multiple_MAIN.p6"
Usage:
  multiple _MAIN.p6 send <filename>
  multiple _MAIN.p6 fetch <filename>
  multiple _MAIN.p6 compare <file1> <file2>
)