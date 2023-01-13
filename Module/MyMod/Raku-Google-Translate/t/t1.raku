
#`(
 use Cro::HTTP::Client;
 my $resp = await Cro::HTTP::Client.new(
     headers => [
        User-agent => 'Cro'
    ]
 ).get('https://translate.google.cn');
 say await $resp.body-text();

 say "---" xx 20;


 use HTTP::UserAgent;
 my $ua = HTTP::UserAgent.new;
 $ua.timeout = 30;
 my $response = $ua.get("https://translate.google.cn");

 if $response.is-success {
     say $response.content;
 } else {
     die $response.status-line;
 }

 use WWW;
 say get("https://perl6.org").match(/tkk\:\'\d+[\.\d+]?\'/)
)


use Cro::HTTP::Client;
my $resp = await Cro::HTTP::Client.get('https://translate.google.cn', :http<1.1>);
say await $resp.body-text();