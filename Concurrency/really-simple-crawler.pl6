use Cro::HTTP::Client;
use Cro::Uri;

sub crawl($initial-url) {
    react {
        my %seen;
        my $client = Cro::HTTP::Client.new;
        crawl-url(Cro::Uri.parse($initial-url));

        sub crawl-url(Cro::Uri $url) {
            return if %seen{$url}++;
            say "Getting $url";
            whenever $client.get($url) -> $response {
                if $response.content-type.type-and-subtype eq 'text/html' {
                    get-links($response, $url);
                }
                QUIT {
                    default {
                        note "$url failed: " ~ .message;
                    }
                }
            }
        }

        sub get-links($response, $base) {
            whenever $response.body-text -> $text {
                for $text.match(/'href="' <!before \w+':'> <( <-["]>+/, :g) {
                    crawl-url $base.add(~$_);
                }
            }
        }
    }
}

crawl("https://commaide.com/");
