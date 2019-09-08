class App::Anki::Model {
    has $.model-id is rw;
    has $.name is rw;
    has &.set-fields is rw;
    has &.set-templates is rw;
    has $.css is rw;

    method set-fields($fields) {
        given $fields {
            when List {

            }
        }
    }

}