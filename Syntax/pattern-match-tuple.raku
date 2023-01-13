my %user = %{id => 1, name => "John", email => "john@example.com", active => True};

my ($status, $user) = ('ok', %user);

given ($status, $user) {
    when ('ok', %{id => 1, name => $name, :active, email => "john@example.com"}) { say $name }
    when ('ok', *) { say $_ }
    default { say 'unknow' }
}

