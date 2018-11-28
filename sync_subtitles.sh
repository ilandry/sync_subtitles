#!/bin/bash

if [ $# -ne 2 ]; then
    echo $0 : usage: sync_subtitles subtitle_file seconds_offset
    exit 1
fi

file_name=$1
seconds_offset=$2

perl -MTime::Clock -pe 's/([0-9]{2}\:[0-9]{2}\:[0-9]{2})(\,[0-9]{3}\s\-\-\>\s)([0-9]{2}\:[0-9]{2}\:[0-9]{2})(\,[0-9]{3})/"".sub {my $t = Time::Clock->new($1); $t->add(seconds => '$seconds_offset'); return $t;}->().$2.sub {my $t = Time::Clock->new($3); $t->add(seconds => '$seconds_offset'); return $t;}->().$4.""/eg' $file_name
