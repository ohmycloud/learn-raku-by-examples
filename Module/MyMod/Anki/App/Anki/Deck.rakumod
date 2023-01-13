use v6.d;

class App::Anki::Deck {
    has $.deck-id;
    has $.name;
    has $.description;
    has @.notes;
    has %.models; # map of model id to model

    method add-note($note) {
        self.notes.append($note);
    }

    method add-model($model) {
        self.models{$model.model-id} = $model;
    }

    method to_json() {
        return %{
            "collapsed" => False,
            "conf" => 1,
            "desc" => self.description,
            "dyn" => 0,
            "extendNew" => 0,
            "extendRev" => 50,
            "id" => self.deck_id,
            "lrnToday" => [
                163,
                2
            ],
            "mod" => 1425278051,
            "name" => self.name,
            "newToday" => [
                163,
                2
            ],
            "revToday" => [
                163,
                0
            ],
            "timeToday" => [
                163,
                23598
            ],
            "usn" => -1
        }   
    }

    method write-to-db($cursor, $now-ts) {
        if self.deck-id !~~ Int {

        }

        if self.name !~~ Str {

        }

        my $models_json_str, = $cursor.execute('SELECT models from col').fetchone();
        my %models = from-json $models_json_str;

        for self.notes -> $note {
            self.add-model($note.model);
        }

        %models ,= .model-id => .to-json($now-ts, self.deck-id) for self.models.values;
        $cursor.execute('UPDATE col SET models = ?', (to-json %models,));

        .write-to-db($cursor, $now-ts, self.deck-id) for self.notes;
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


    use App::Anki::Package;
        Anki::Package.write_to_collection_from_addon();
    }

}































