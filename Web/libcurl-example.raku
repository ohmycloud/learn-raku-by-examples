use LibCurl::Easy;

#| https://github.com/CurtTilmes/perl6-libcurl#simple-examples
# GET
print LibCurl::Easy.new(URL => 'http://www.baidu.com').perform.content;

# POST
