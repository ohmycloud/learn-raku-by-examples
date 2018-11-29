use v6;

use NCurses;
use NativeCall;

sub setlocale(int32, Str) returns Str is native(Str) {*};
setlocale(0, "");

constant numstars  = 100;
my $win = initscr() or die "Failed to initialize ncurses\n";
my $screen-x  =  getmaxx($win);
my $screen-y  =  getmaxy($win);

color_set(5, 125);

constant max-speed =   4;

repeat {
    clear;
    for $=finish.lines.comb -> $w {
        # say $w;
        mvaddstr( (^125).pick, (^10).pick, $w );
    }
    nc_refresh;
    sleep( .25 );
} while getch() < 0;

# Cleanup
LEAVE {
    delwin($win)  if $win;

    # End curses mode
    endwin;
}


# for $=finish.lines.comb -> $w {say $w;}

=finish
　　　　星月神话
我的一生最美好的场景
　
就是遇见你
　
在人海茫茫中静静凝望着你
　
陌生又熟悉
　
尽管呼吸着同一天空的气息

却无法拥抱到你
　
如果转换了时空身份和姓名
　　　
但愿认得你眼睛
　
千年之后的你会在哪里
　
身边有怎样风景
　
我们的故事并不算美丽
　
却如此难以忘记
　 
尽管呼吸着同一天空的气息
　
却无法拥抱到你
　 
如果转换了时空身份和姓名
　
但愿认得你眼睛
　
千年之后的你会在哪里
　
身边有怎样风景
　
我们的故事并不算美丽
　
却如此难以忘记
　
如果当初勇敢的在一起
　 
会不会不同结局
　
你会不会也有千言万语
　
埋在沉默的梦里　