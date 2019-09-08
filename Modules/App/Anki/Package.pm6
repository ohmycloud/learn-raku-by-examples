class App::Anki::Package {
    has $.deck-or-decks is rw;
    has $.media-files is rw;
    has $.decks is rw;

    method write-to-file($file) {

    }

    method write-to-db($cursor, $now-ts) {
        $cursor.executescript($APKG_SCHEMA);
        $cursor.executescript($APKG_COL);

        .write-to-db($cursor, $now-ts) for self.decks;
    }

    method write-to-collection-from-addon() {
        #`(
            Write to local collection. *Only usable when running inside an Anki addon!* Only tested on Anki 2.1.

            This writes to a temporary file and then calls the code that Anki uses to import packages.
        
            Note: the caller may want to use mw.checkpoint and mw.reset as follows:
        
              # creates a menu item called "Undo Add Notes From MyAddon" after this runs
              mw.checkpoint('Add Notes From MyAddon')
              # run import
              my_package.write_to_collection_from_addon()
              # refreshes main view so new deck is visible
              mw.reset()
        
            Tip: if your deck has the same name and ID as an existing deck, then the notes will get placed in that deck rather
            than a new deck being created.
        )
    }

}