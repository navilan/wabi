set background to (POSIX path of (path to home folder)) & "wabi/backgrounds/haskell.jpg"
tell application "System Events"
  tell every desktop
    if get picture rotation is 1 then set picture rotation to 0
    set picture to POSIX file background
  end tell
end tell
