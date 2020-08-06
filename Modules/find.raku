use Concurrent::File::Find;

find(%*ENV<HOME>
    , :extension('txt', {.contains('~')}) # ends in .txt or ends in something that contains a ~
    , :exclude('covers') # exclude any path that contains covers, both for files and directories
    , :exclude-dir('.') # exclude any directory-path that contains a . 
    , :file # return file paths
    , :!directory # don't return directory paths
    , :symlink # return symlink paths
    , :max-depth(5) # but not deeper then 5 directories deep
    , :follow-symlink # follow symlinks (no loop detection yet)
    , :keep-going # on error (no access, stale symlink, etc.), keep going
    , :quiet # don't report errors on STDERR
).elems.say; # count how many files and symlinks we got

sleep 10;

# find-simple 函数返回的是一个 `List`, 这个列表混合了一个匿名角色,
# @l 数组因此拥有了一个名为 `channel` 的方法。
my @l := find-simple(%*ENV<HOME>, :keep-going, :!no-thread); # binding to avoid eagerness

for @l {
    # @l 的 channel 方法是一个 `$channel` 变量, 它可以被关闭。
    @l.channel.close if $++ > 5000; # hard-close the channel after 5000 found files
    .say if $++ %% 100 # print every 100th file
}