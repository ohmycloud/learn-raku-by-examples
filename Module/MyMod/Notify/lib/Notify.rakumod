unit class Notify:ver<0.0.5>;

has $.title is rw;
has $.msg is rw;
has $.duration-time is rw;
has $.msg-type is rw;

method !notify-command-windows(:$title, :$msg, :$duration-time=Nil, :$msg-type='info') {
    my @command = ["notify-send"];
    @command.append([$title, $msg]);
    if $duration-time.defined {
        @command.append(["-t", $duration-time.Str]);
    }

    if $msg-type.defined  {
        @command.append(["-i", $msg-type]);
    }

    return @command;
}

method !notify-command-linux(:$msg, :$duration-time=Nil) {
    my @command = ["/usr/bin/notify-send"];
    @command.append($msg);
    if $duration-time.defined > 0 {
        @command.append(["-t", $duration-time.Str]);
    }

    @command.append(["-h", "int:transient:1"]);
    return @command;
}

method !notify-command-osx(:$msg, :$msg-type=1, :$duration-time=Nil, :$title="") {
    my @command = ["/usr/bin/osascript", "-e"];
    my $tpl = 'display notification "%s" %s with title "{$title}"';
    my $sound = "";
    if $msg-type.defined {
        $sound = 'sound name "/System/Library/Sounds/Ping.aiff"';
    }
    
    @command.append($tpl.sprintf($msg, $sound));
    return @command;
}

#| Show system notification with duration t (ms)
method notify() {
    my $msg = self.msg.subst('"', '\\"', :g);
    my $title = self.title;
    my $duration-time = self.duration-time;
    my $msg-type = self.msg-type;
    my @command;

    given $*KERNEL {
        when 'win32' { @command = self!notify-command-windows(:$msg, :$title, :$duration-time, :$msg-type) }
        when 'darwin' { @command = self!notify-command-osx(:$msg, :$msg-type, :$duration-time) }
        when 'linux' { @command = self!notify-command-linux(:$msg, :$duration-time) }
    }

    await Proc::Async.new(|@command).start;
}


=begin pod

=head1 NAME

Notify - minimal notifying tool for Raku

=head1 SYNOPSIS

=begin code :lang<raku>

use Notify;
my $notify = Notify.new(:title('Take a break'), :msg('You\'ve been working for 45 minutes'), :msg-type('info'));
$notify.notify();

=end code

=head1 DESCRIPTION

Notify is a minimal notifying tool for Raku.

=head1 AUTHOR

<ohmycloudy@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2021 

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
