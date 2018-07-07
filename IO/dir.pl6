for dir('.', test => *) -> $file {
   rename $file, $file.lc if $file.f;
}
