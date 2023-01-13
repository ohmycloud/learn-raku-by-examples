class Task {
    has      &!callback;
    has Task @!dependencies;
    has Bool $.done;

    # Normally doesn't need to be written
    # BUILD is the equivalent of a constructor in other languages
    method new(&callback, *@dependencies) {
        return self.bless(:&callback, :@dependencies);
    }

    submethod BUILD(:&!callback, :@!dependencies) { }

    method add-dependency(Task $dependency) {
        push @!dependencies, $dependency;
    }

    method perform() {
        unless $!done {
            .perform() for @!dependencies;
            &!callback();
            $!done = True;
        }
    }
}

my $eat =
    Task.new({ say 'eating dinner. NOM!' },
        Task.new({ say 'making dinner' },
            Task.new({ say 'buying food' },
                Task.new({ say 'making some money' }),
                Task.new({ say 'going to the store' })
            ),
            Task.new({ say 'cleaning kitchen' })
        )
    );

$eat.perform();
