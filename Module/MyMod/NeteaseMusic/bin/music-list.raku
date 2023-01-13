use lib '../';
use NeteaseMusic;

# https://music.163.com/song?id=1946926689&userid=2539497
# song?id=1946926689&userid=2539497
my $user-id = '2539497';
my $song-id = '1946926689';
my $netease = NeteaseMusic.new();
dd $netease.get-listening-list($user-id);