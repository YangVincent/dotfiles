tell application "Quiver" 
    activate
end tell

tell application "System Events"
    -- jump to the correct location (split mode pane)
    keystroke tab
    keystroke tab
    
    -- if we were already in the cell, jump back
    key down {shift}
    keystroke tab
    keystroke tab
    key up {shift}
    delay 0.01

    -- remap vim
    keystroke ":imap jk <Esc>"
    keystroke return
end tell
