set background to (POSIX path of (path to home folder)) & "Downloads/wallpapers"
tell application "System Events"
  tell every desktop
    set pictures folder to background
    set picture rotation to 2
    set change interval to 1000
    set random order to true
  end tell
end tell
