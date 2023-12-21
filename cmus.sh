#!/bin/bash

prepend_zero () {
    seq -f "%02g" $1 $1
}

player () {
    echo -n "$artist - $song [$minutes1:$seconds1/$minutes2:$seconds2]"
}

artist=$(echo -n $(cmus-remote -C status | grep "tag artist" | cut -c 12-))

if [[ $artist = *[!\ ]* ]]; then
    song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))
    position=$(cmus-remote -C status | grep position | cut -c 10-)
    minutes1=$(prepend_zero $(($position / 60)))
    seconds1=$(prepend_zero $(($position % 60)))
    duration=$(cmus-remote -C status | grep duration | cut -c 10-)
    minutes2=$(prepend_zero $(($duration / 60)))
    seconds2=$(prepend_zero $(($duration % 60)))
    shuffle=$(cmus-remote -C status | grep "shuffle" | cut -c 13-)
    repeat=$(cmus-remote -C status | grep "repeat_current" | cut -c 20-)

    ## see whether shuffle is enabled, if so, print that it is, then
    ## print the player, and then if repeat is enabled, then print that it is :)

    if [[ $shuffle = true ]]; then
        echo -n "  "
    fi
    player
    if [[ $repeat = true ]]; then
        echo -n " "
    fi
else
    echo
fi
