#!/usr/bin/env raku
use v6.d;

#use Grammar::Debugger;

my Str enum TestStatus (started => 'started', failed => 'failed', passed => 'passed');

my $input = q:to/END/;
Test Suite 'RegexDSLTests' started at 2022-06-06 09:41:00.001
Test Suite 'RegexDSLTests' failed at 2022-06-06 09:41:00.001.
Test Suite 'RegexDSLTests' passed at 2022-06-06 09:41:00.001.
END

grammar TestSuite {
    token TOP                { <test-case>+ %% \n                                                 }
    token test-case          { 'Test Suite' \s+ "'" ~ "'" \w+ \s+ <status> \s+ at \s+ <date> '.'? }
    token status             { 'started' | 'failed' | 'passed'                                    }
    token date               { <day> \s+ <hour-minute-second>                                     }
    token day                { [\d+]+ % '-'                                                       }
    token hour-minute-second { [\d+]+ % <[:.]>                                                    }
}

class TestSuiteData {
    has $.status;
    has $.date;
}

class TestSuitAction {
    method TOP($/)                {
        make $<test-case>».made;
        TestSuiteData.new(
                status =>

        )
    }
    method test-case($/)          { make $<date>.made }
    method status($/)             { make ~$/ }
    method date($/)               { make DateTime.new(~$<day> ~ 'T' ~ ~$<hour-minute-second>) }
    method day($/)                { make ~$/ }
    method hour-minute-second($/) { make ~$/ }
}

my $actions = TestSuitAction.new;

my $match = TestSuite.parse($input, :$actions);
dd $match.made;