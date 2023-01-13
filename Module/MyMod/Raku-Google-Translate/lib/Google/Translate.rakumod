#! /usr/bin/env false

use v6.c;

unit class Google::Translate;
use Cro::HTTP::Client;
use WWW;

# https://github.com/ohmycloud/py-googletrans/blob/master/googletrans/client.py
# https://github.com/wizyoung/googletranslate.popclipext


#`(
        Google Translate API token generator
    translate.google.com uses a token to authorize the requests. If you are
    not Google, you do have this token and will have to pay for use.
    This class is the result of reverse engineering on the obfuscated and
    minified code used by Google to generate such token.
    The token is based on a seed which is updated once per hour and on the
    text that will be translated.
    Both are combined - by some strange math - in order to generate a final
    token (e.g. 744915.856682) which is used by the API to validate the
    request.
    This operation will cause an additional request to get an initial
    token from translate.google.com.
    Example usage:
        > use TokenAcquirer
        > my $acquirer = TokenAcquirer();
        > my $text = 'test';
        > my $tk = $acquirer.do($text);
        > say $tk; # 950629.577246
)

class Translator {
    has $.service_urls is rw = {};
    has $.user_agent is rw = {};
    has $.proxies is rw = {};
    has $.timeout is rw = {};


}

=begin pod

=NAME    Google::Translate
=AUTHOR  ohmycloud <ohmycloudy@gmail.com>
=VERSION 0.0.0

=head1 Synopsis

=head1 Description

=head1 Examples

=head1 See also

=end pod

# vim: ft=perl6 noet
