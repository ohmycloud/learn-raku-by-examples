class Constant {
    has IO::Path $.conf_dir     = $*HOME.add(".netease-musicbox");
    has IO::Path $.download_dir = $!conf_dir.add("cached");
    has IO::Path $.config_path  = $!conf_dir.add("config.json");
    has IO::Path $.storage_path = $!conf_dir.add("database.json");
    has IO::Path $.cookie_path  = $!conf_dir.add("cookie");
    has IO::Path $.log_path     = $!conf_dir.add("musicbox.log");
    has IO::Path $.cache_path   = $!conf_dir.add("nemcache");
}
