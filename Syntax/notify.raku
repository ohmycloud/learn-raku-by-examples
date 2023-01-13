sub notify-command-windows(:$title, :$msg, :$duration-time=Nil, :$msg-type='info') {
    my @command = ["D:\\software\\notify-send.exe"];
    @command.append([$title, $msg]);
    if $duration-time.defined {
        @command.append(["-t", $duration-time.Str]);
    }

    if $msg-type.defined  {
        @command.append(["-i", $msg-type]);
    }

    return @command;
}

sub notify-command-linux(:$msg, :$duration-time=Nil) {
    my @command = ["/usr/bin/notify-send"];
    @command.append($msg);
    if $duration-time.defined > 0 {
        @command.append(["-t", $duration-time.Str]);
    }

    @command.append(["-h", "int:transient:1"]);
    return @command;
}

sub notify-command-osx(:$msg, :$msg-type=1, :$duration-time=Nil) {
    my @command = ["/usr/bin/osascript", "-e"];
    my $tpl = 'display notification "%s" %s with title "!!!下班记得打卡!!!"';
    my $sound = "";
    if $msg-type.defined {
        $sound = 'sound name "/System/Library/Sounds/Ping.aiff"';
    }
    
    @command.append($tpl.sprintf($msg, $sound));
    return @command;
}

sub notify(:$msg is copy, :$msg-type=0, :$duration-time=Nil, :$title = "") {
    #| Show system notification with duration t (ms)
    $msg = $msg.subst('"', '\\"', :g);
    my @command;

    given $*KERNEL {
        when 'win32' { @command = notify-command-windows(:$msg, :$title, :$duration-time, :$msg-type) }
        when 'darwin' { @command = notify-command-osx(:$msg, :$msg-type, :$duration-time) }
        when 'linux' { @command = notify-command-linux(:$msg, :$duration-time) }
    }

    await Proc::Async.new(|@command).start;
}

sub MAIN() {
    #notify('I\'m test ""quote', :msg-type(1), :duration-time(1000));
    #notify("I'm test 1", :msg-type(1), :duration-time(1000));
    #notify("I'm test 2", :msg-type(0), :duration-time(1000));
    #react whenever Supply.interval(900) {
    #    state $n = 1;
    #    notify($n++ ~ ' 秒后关机!', :msg-type(1), :duration-time(1000));
    #}
    react whenever Supply.interval(1200) {
        notify(:title('已工作20分钟'), :msg('休息一下，马上回来！'), :msg-type('important'));
    }
}