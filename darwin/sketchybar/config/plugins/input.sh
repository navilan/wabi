#!/usr/bin/env sh
#
SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)


case ${SOURCE} in
'com.apple.keylayout.ABC-India') LABEL='A' ;;
'com.apple.keylayout.ABC-US') LABEL='U' ;;
'com.apple.keylayout.Anjal') LABEL='அ' ;;
esac

sketchybar --set $NAME icon="$LABEL"
