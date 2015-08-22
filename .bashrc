# [[ $- = *i* ]] && bind TAB:menu-complete

[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
