unit class NetEase::Music::Constant;

"foo/bar".IO.mkdir;
"foo/bar".IO.add("meow")    .resolve.relative.say; # OUTPUT: «foo/bar/meow␤» 
"foo/bar".IO.add("/meow")   .resolve.relative.say; # OUTPUT: «foo/bar/meow␤» 
"foo/bar".IO.add("meow.txt").resolve.relative.say; # OUTPUT: «foo/bar/meow.txt␤» 

has $.conf_dir     = $*HOME.add(".netease-musicbox");
has $.download_dir = $!conf_dir.add("cached");
has $.config_path  = $!conf_dir.add("config.json");
has $.storage_path = $!conf_dir.add("database.json");
has $.cookie_path  = $!conf_dir.add("cookie");
has $.log_path     = $!conf_dir.add("musicbox.log");
has $.cache_path   = $!conf_dir.add("nemcache");