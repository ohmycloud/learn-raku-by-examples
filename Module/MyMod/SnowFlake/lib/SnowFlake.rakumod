unit class SnowFlake;

constant WORKER_ID_BITS = 5;
constant SEQUENCE_BITS = 12;
constant MAX_WORKER_ID = -1 +^ (-1 +< WORKER_ID_BITS);
constant TWEPOCH = 1594977661913;

my \WORKER_ID_SHIFT = SEQUENCE_BITS;
my \TIMESTAMP_LEFT_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS;
my \SEQUENCE_MASK = -1 +^ (-1 +< SEQUENCE_BITS);

has $.worker_id;
has $.sequence is rw = 0;
has $.last_timestamp is rw = -1;

method get_timestamp() {
    return (now * 1000).Int;
}

method wait_next_millis($last_timestamp) {
    my \timestamp = self.get_timestamp();
    while timestamp <= $last_timestamp {
        timestamp = self.get_timestamp();
    }

    return timestamp;
}

method get_id() {
    my \timestamp = self.get_timestamp();
    if timestamp < $!last_timestamp {
        ...
    }

    if timestamp == $!last_timestamp {
        self.sequence = ($!sequence + 1) +& SEQUENCE_MASK;
        if $!sequence == 0 {
            timestamp = self.wait_next_millis($!last_timestamp);
        }
    } else {
        self.sequence = 0;
    }

    self.last_timestamp = timestamp;
    ((timestamp - TWEPOCH) +< TIMESTAMP_LEFT_SHIFT) +| ($!worker_id +< WORKER_ID_SHIFT) +| $!sequence
}