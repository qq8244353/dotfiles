#!/bin/sh

BLANK='#00000000'
OVERLAY='#00000033'
TEXT='#C5C8C6FF'
KEYINPUT='#79DE79CC'
WRONG='#FB6962CC'
VERIFYING='#A8E4EFCC'

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#ff00ffcc'
TEXT='#ee00eeee'
WRONG='#880000bb'
VERIFYING='#bb00bbbb'

xset s off dpms 0 10 0
#:wq
i3lock --color=4c7899 --ignore-empty-password --show-failed-attempts --nofork
xset s off -dpms
