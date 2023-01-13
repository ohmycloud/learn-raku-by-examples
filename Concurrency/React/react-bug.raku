BEGIN: {
    $*SCHEDULER = ThreadPoolScheduler.new: :max_threads(200);
}

constant JOBS = 100;
constant TOTAL = 1000000;
constant EVENTS = 10;

my atomicint $failures = 0;
my atomicint $total-ran = 0;

class Event {
    has Promise:D $.complete .= new;
    has Bool:D $.last = False;
}

class EventLoop {
    has Int:D $.id is required;
    has Channel $.queue .= new;
    has atomicint $.count is rw = 0;
    has Promise $.done;
    has Promise $.ev-loop is rw;

    # has Supplier:D $.supplier .= new;
    # has Supply $.queue = $!supplier.Supply;

    submethod TWEAK {
        self.event-loop;
    }

    method run {
        CATCH {
            note "IN RUNNER: ", .message;
            .rethrow;
        }
        sub send-events {
            for ^EVENTS -> $i {
                my Event:D $ev = Event.new: :last($i == (EVENTS - 1));
                # XXX THE PACKET IS GETTING SEND, NO ERROR HERE ...
                $.queue.send: $ev;
                # $.supplier.emit: $ev;
                await $ev.complete.then: {
                    ++⚛$!count if .status ~~ Kept;
                };
            }
        }
        ++⚛$total-ran;
        $!done = Promise.anyof(
            Promise.in(10).then({
                if $!done.status ~~ Planned {
                    note "ID #$.id TIMED OUT, channel stuck after ", $!count, " processed events";
                    ++⚛$failures;
                    die "$.id timed out"
                }
            }),
            start {
                send-events;
                note "ID $!id: bad count of processed events: ", $!count if $!count != EVENTS;
            }
        )
    }

    # Fetching with `react`
    method event-loop {
        # XXX ... THE PACKET DOESN'T LAND IN $ev
        $.ev-loop = start react whenever $.queue -> $ev {
            $ev.complete.keep;
            done if $ev.last;
        }
    }

    # Fetching with `tap`
    # # THIS VERSION IS SEEMINGLY NOT AFFECTED BY THE PROBLEM
    # method event-loop {
    #         $.queue.tap:
    #             -> $ev {
    #                 $ev.complete.keep;
    #                 $.supplier.done if $ev.last;
    #             }
    # }

    # Fetching with `receive`
    # # THIS VERSION IS SEEMINGLY NOT AFFECTED BY THE PROBLEM
    # method event-loop {
    #     $.ev-loop = start {
    #         CATCH {
    #             note "ID #$!id IN EV LOOP: ", .message;
    #             .rethrow;
    #         }
    #         loop {
    #             my $ev = $.queue.receive;
    #             $ev.complete.keep;
    #             last if $ev.last;
    #         }
    #     }
    # }
}

my %active;
my $id = 0;
my $lock = Lock.new;

while ($id < TOTAL || +%active) && $failures < 2 {
    my @promises;
    $lock.protect: {
        $*ERR.printf: "Active: %4d / %6d \r", %active.elems, $id;
        if $id >= TOTAL || %active.elems >= JOBS {
            @promises = %active.values.map: *.done;
        }
    }
    if @promises {
        await Promise.anyof(@promises);
    }
    while ($id < TOTAL) && (%active.elems < JOBS) {
        my $cur_id = $id;
        my $el = EventLoop.new: :$id;
        $lock.protect: {
            %active{$cur_id} = $el;
            $*ERR.printf: "Active: %4d / %6d \r", %active.elems, $id if ($id % 100) == 0;
        }
        $el.run;
        $el.done.then: {
            $lock.protect: {
                %active{$cur_id}:delete;
            }
        }
        ++$id;
    }
}

note "\nDone, failure rate: ", $failures / $total-ran;

exit ($failures min 254)