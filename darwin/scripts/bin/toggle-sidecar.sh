osascript -e '
on run {input, parameters}
    tell application "System Preferences"
        activate
        reveal pane id "com.apple.preference.displays"
        delay 1

        tell application "System Events" to click first pop up button of first window of application process "System Preferences" of application "System Events"
        tell application "System Events" to click third menu item of first menu of first pop up button of first window of application process "System Preferences" of application "System Events"

        quit
    end tell
end run
'