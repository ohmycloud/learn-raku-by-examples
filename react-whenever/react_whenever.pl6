# The react/whenever construct for processing asynchronous data
react {
    whenever Supply.interval(0.5) {
        say now;
    }
    whenever Promise.in(3) {
        done;
    }
}
