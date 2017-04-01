# [[ $- = *i* ]] && bind TAB:menu-complete

alias tmux="TERM=screen-256color-bce tmux"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
if [[ '' = "$TMUX" ]]
then
    export INPUTRC=~/.inputrc
else
    export INPUTRC=~/.tmux.inputrc
    echo Welcome to Tmux!
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
