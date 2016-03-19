# [[ $- = *i* ]] && bind TAB:menu-complete

[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

