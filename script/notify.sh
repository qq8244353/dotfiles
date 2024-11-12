#!/bin/bash
set -u
: $1 $2 $3

sleep $1
afplay /System/Library/Sounds/Blow.aiff &
osascript -e "display alert \"${2}\" buttons {\"OK\"}"
