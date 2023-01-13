use Terminal::ANSIColor;

# constants. Should not be exported by default, TBD
say BOLD, "Oh, so good to be fat!", RESET;
say ITALIC, "Oh, so good to be leaning!", ITALIC_OFF;
say color('underline red on_yellow'),
	"Hey, isn't it awesome?", color('reset');
say colored("IM IN UR MODULE MESSING WITH UR COLOURS",
			"bold green on_blue");

# 256-color support: '196 on_54'
my $psych = "Yo, I got your psychedelia right here!"
    .words.map({ colored("$_ ", "{(^256).pick} on_{(^256).pick}") }).join;
say $psych;
say colorstrip($psych);

# 24-bit support
my $escapes = color('255,255,0 on_187,0,0');
my $description = uncolor($escapes);
say "'$description' encodes to:";
say $escapes.perl;

say "----";

{

    use Terminal::ANSIColor;
    say color('bold'), "this is in bold", color('reset');
    say colored('what a lovely colours!', 'underline red on_green');
    say BOLD, 'good to be fat!', BOLD_OFF;
    say 'ok' if colorvalid('magenta', 'on_black', 'inverse');
    say '\e[36m is ', uncolor('\e36m');
    say colorstrip("\e[1mThis is bold\e[0m");

}    