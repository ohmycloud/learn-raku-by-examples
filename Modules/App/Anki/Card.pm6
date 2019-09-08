class App::Anki::Card {
    has $.ord;
    has $.suspend = False;

    method write-to-db($cursor, $now-ts, $deck-id, $note-id) {
        my $queue = self.suspend ?? -1 !! 0;
        $cursor.execute('INSERT INTO cards VALUES(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);', (
            $note-id,   # nid
            $deck-id,   # did
            self.ord,   # ord
            $now-ts,    # mod
            -1,         # usn
            0,          # type (=0 for non-Cloze)
            $queue,     # queue
            0,          # due
            0,          # ivl
            0,          # factor
            0,          # reps
            0,          # lapses
            0,          # left
            0,          # odue
            0,          # odid
            0,          # flags
            "",         # data
        ))
    }
}
