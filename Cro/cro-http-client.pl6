use Cro::HTTP::Client;

my $resp = await Cro::HTTP::Client.get('http://www.baidu.com');
say $resp.WHAT;
say $resp.^methods;
# trace-output set-cookie cookies get-response-phrase add-push-promise push-promises close-push-promises
# body body-text header-list headers set-body has-header header body-blob set-body-byte-stream
# body-byte-stream has-body body-text-encoding content-type Str AUTOGEN AUTOGEN request status
# body-parser-selector body-serializer-selector http-version http2-stream-id BUILDALL
say await $resp.body-text;
say ~$resp;
