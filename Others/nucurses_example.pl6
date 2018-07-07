use v6;
use NCurses;

# Initialize curses window
my $win = initscr() or die "Failed to initialize ncurses\n";
start_color;

# Initialize colors
init_pair(1, COLOR_WHITE, COLOR_RED);
init_pair(2, COLOR_WHITE, COLOR_BLUE);

# Print Hello World
color_set(1, 0);
mvaddstr( 10, 10, "你好");
mvaddstr( 15, 10, "ウルヰ");
color_set(2, 0);
mvaddstr( LINES() - 2, 2, "Press any key to exit..." );

# Refresh (this is needed)
nc_refresh;

# Wait for a keypress
getch;

# Cleanup
LEAVE {
    delwin($win) if $win;
    endwin;
}
