grammar CSV {
    token TOP { [ <line> \n? ]+ }
    token line {
        ^^            # Beginning of a line
        <value>* % \, # Any number of <value>s with commas in `between` them
        $$            # End of a line
    }
    token value {
        [
        | <-[",\n]>     # Anything not a double quote, comma or newline
        | <quoted-text> # Or some quoted text
        ]*              # Any number of times
    }
    token quoted-text {
        \"
        [
        | <-["\\]> # Anything not a " or \
        | '\"'     # Or \", an escaped quotation mark
        ]*         # Any number of times
        \"
    }
}

say "Valid CSV file!" if CSV.parse( q:to/EOCSV/ );
    Year,Make,Model,Length
    1997,Ford,E350,2.34
    2000,Mercury,Cougar,2.38
    EOCSV