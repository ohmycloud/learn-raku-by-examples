# Creating a server...
use Cro::HTTP::Server;

my Cro::Service $service = Cro::HTTP::Server.new(
    :host('localhost'), :port(2314), :$application
);
# Running it
$service.start;
# Add up a react block to keep running until Ctrl-C signal
react whenever signal(SIGINT) {
    $hello-service.stop;
    exit;
}
