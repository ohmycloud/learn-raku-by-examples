use Menu::Simple;

# The code to run after an option is selected
sub some-action {
  say "running some-action";
}

# Construct a submenu and add two options to it
my $submenu = Menu.new().add-options: <'First option', 'Second option'>;

# Create a main menu
my $menu = Menu.new();

# Add an option to the main menu with an action that runs an action
$menu.add-option(
    action => &some-action,
    option-value => 'some value',
    display-string => "Do an action"
);

# Add an option that will show the submenu
$menu.add-option(
    submenu        => $submenu,
    option-value => 'some other value',
    display-string => 'Show submenu'
);

# Add an option that calls the action and shows the submenu
$menu.add-option(
    action         => &some-action,
    submenu        => $submenu,
    display-string => 'Do an action and show submenu' );

# Execute the menu
$menu.execute;