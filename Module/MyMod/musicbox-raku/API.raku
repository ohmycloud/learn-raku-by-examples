use OrderedHash;
use Cro::HTTP::Client;
#use Cro::HTTP::Client::CookieJar;

# 歌曲榜单地址
my %TOP_LIST_ALL = 
    0 => ["云音乐新歌榜", "3779629"],
    1 => ["云音乐热歌榜", "3778678"],
    2 => ["网易原创歌曲榜", "2884035"],
    3 => ["云音乐飙升榜", "19723756"],
    4 => ["云音乐电音榜", "10520166"],
    5 => ["UK排行榜周榜", "180106"],
    6 => ["美国Billboard周榜", "60198"],
    7 => ["KTV嗨榜", "21845217"],
    8 => ["iTunes榜", "11641012"],
    9 => ["Hit FM Top榜", "120001"],
    10 => ["日本Oricon周榜", "60131"],
    11 => ["韩国Melon排行榜周榜", "3733003"],
    12 => ["韩国Mnet排行榜周榜", "60255"],
    13 => ["韩国Melon原声周榜", "46772709"],
    14 => ["中国TOP排行榜(港台榜)", "112504"],
    15 => ["中国TOP排行榜(内地榜)", "64016"],
    16 => ["香港电台中文歌曲龙虎榜", "10169002"],
    17 => ["华语金曲榜", "4395559"],
    18 => ["中国嘻哈榜", "1899724"],
    19 => ["法国 NRJ EuroHot 30周榜", "27135204"],
    20 => ["台湾Hito排行榜", "112463"],
    21 => ["Beatport全球电子舞曲榜", "3812895"],
    22 => ["云音乐ACG音乐榜", "71385702"],
    23 => ["云音乐嘻哈榜", "991319590"];

my %PLAYLIST_CLASSES does OrderedHash = 

  a => ["华语", "欧美", "日语", "韩语", "粤语", "小语种"],
  b => ["流行", "摇滚", "民谣", "电子", "舞曲", "说唱",
            "轻音乐", "爵士", "乡村", "R&B/Soul", "古典", "民族", 
            "英伦", "金属", "朋克", "蓝调", "雷鬼", "世界音乐", 
            "拉丁", "另类/独立", "New Age", "古风", "后摇", "Bossa Nova"
            ],
  c => ["清晨", "夜晚", "学习", "工作", "午休", "下午茶", "地铁", "驾车", "运动", "旅行", "散步", "酒吧"],
  d => ["怀旧", "清新", "浪漫", "性感", "伤感", "治愈", "放松", "孤独", "感动", "兴奋", "快乐", "安静", "思念"],   
  e => ["影视原声", "ACG", "儿童", "校园", "游戏", "70后", "80后", "90后", "网络歌曲", "KTV", "经典", "翻唱", "吉他", "钢琴", "器乐", "榜单", "00后"];

constant DEFAULT_TIMEOUT = 10;
constant BASE_URL = "http://music.163.com";

class Parse {
    sub song-url-by-id($cls, $sid) {
        my $url = sprintf("http://music.163.com/song/media/outer/url?id=%s.mp3", $sid);
        my $quality = "LD 128k";
        return ($url, $quality)
    }

    sub song-url($cls, %song) {
        my $quality;
        if %song.contains('url') {
            my $url = %song['url'];
            if $url {
                return 'parse url'
            }
            my $br = %song{'br'};
            if $br >= 320000 {
                $quality = "HD";
            } elsif $br >= 192000 {
                $quality = "MD";
            } else {
                $quality = "LD";
            }

            return ($url, sprintf("%s %sk",$quality, $br // 1000 ))
        } else {
            return 'Parse xxxxx'
        }
    }

    sub song-album($cls, %song) {
        my ($album_name, $album_id);
        if %song.contains('al') {
            if %song{'al'} {
                $album_name = %song{'al'}{'name'};
                $album_id = %song{'al'}{'id'};
            } else {
                $album_name = '未知专辑';
                $album_id = '';
            }
        } elsif %song.contains('album') {
            if %song{'album'} {
                $album_name = %song{'album'}{'name'};
                $album_id = %song{'album'}{'id'};
            } else {
                $album_name = '未知专辑';
                $album_id = '';
            }
        } else {
            # 报错
        }

        return ($album_name, $album_id)
    }

    sub song-artist($cls, %song) {
        my $artist = '';

        # 对新老接口进行处理

        my @name = gather .{'name'}.take for %song{'ar'} if %song.contains('ar');
        $artist = @name.join(", ");

        if $artist eq '' and %song.contains('pc') {
            if %song{'pc'}{'ar'} {
                $artist = %song{'pc'}{'ar'};
            } else {
                $artist = '未知艺术家';
            }
        }

        if %song.contains('artists') {
            $artist =( gather .{'name'}.take for %song{'artists'} ).join(", ");
        }

        return $artist
    }

    sub songs($cls, %songs) {
        my @song-info-list;
        for %songs -> %song {
            my ($url, $quality) = Parse.song_url(%song);
            if  !$url { proceed; }

            my ($album_name, $album_id) = Parse.song_album(%song);
            my %song-info = 
              song_id    => %song<id>,
              artist     => Parse.song_artist(%song),
              song_name  => %song<name>,
              album_name => $album_name,
              album_id   => $album_id,
              mp3_url    => $url,
              quality    => $quality,
              expires    => %song<expires>,
              get_time   => %song<get_time>;

            @song-info-list.append(%song-info);  

        }
        return @song-info-list;
    }

    sub artists($cls, %artists) {
        return (artist_id => .{'id'}, artists_name => .{'name'}, alias => .{'alias'}).take for %artists;
    }

    sub albums($cls, %albums) {
        return (album_id => .{'id'}, albums_name => .{'name'}, artists_name => .{'artist'}{'name'}).take for %albums;
    }

    sub playlists($cls, %playlists) {
        return (playlist_id => .{'id'}, playlist_name => .{'name'}, creator_name => .{'creator'}{'nickname'}).take for %playlists;
    }
}

class NetEase {
    has %.header = 
            "Accept"          => "*/*",
            "Accept-Encoding" => "gzip,deflate,sdch",
            "Accept-Language" =>  "zh-CN,zh;q=0.8,gl;q=0.6,zh-TW;q=0.4",
            "Connection"      => "keep-alive",
            "Content-Type"    => "application/x-www-form-urlencoded",
            "Host"            =>  "music.163.com",
            "Referer"         => "http://music.163.com",
            "User-Agent"      => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36";
    method raw-request($method, $endpoint, %data) {
        my $resp;
        given $method {
            when 'GET'  {}
            when 'POST' {}
        }
    }

    method request($method, $path, %params={}, %default={ "code" => -1 }, %custom_cookies={}) {

    }

    method login($username, $password) {
        # toDO sesssion
        my $path;
        my %params;
        if $username ~~ Int {
            $path = "/weapi/login/cellphone";
            %params = phone => $username, password => $password, rememberLogin => True;
        } else {
            # magick token for login
            # see https://github.com/Binaryify/NeteaseCloudMusicApi/blob/master/router/login.js#L15
            my $client_token = "1_jVUMqWEPke0/1/Vu56xCmJpo5vP1grjn_SOVVDzOc78w8OKLVZ2JH7IfkjSXqgfmh";
            $path = "/weapi/login";
            %params = username => $username, password => $password, rememberLogin => True, clientToken => $client_token;
        }

        my $resp = self.request("POST", $path, %params);
        # todo session cookies save
        return $resp
    }    
}

my $n = NetEase.new();
say $n.login('18612989755', '82041q');