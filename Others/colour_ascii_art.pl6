use v6;
use Terminal::Caca;

# Initialize library
given my $o = Terminal::Caca.new {
    # Set window title
    .title("Perl 6 rocks");

    # Say hello world
    my $text = ' Hello world, from Perl 6! ';
    .color(white, blue);
    .text(10, 10, $text);

    # Draw an ASCII-art box around it
    .thin-box(9, 9, $text.chars + 2, 3);

    # Refresh display
    .refresh;

    # Wait for a key press event
    .wait-for-keypress;

    # Cleanup on scope exit
    LEAVE {
        .cleanup;
    }
}
