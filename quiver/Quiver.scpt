tell application "Quiver" 
    activate
end tell

tell application "System Events"
    keystroke tab
    keystroke tab
    --keystroke "0"
    key down {shift}
    keystroke tab
    keystroke tab
    key up {shift}
    delay 0.01
    keystroke ":imap jk <Esc>"
    keystroke return
end tell
