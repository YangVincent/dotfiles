# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
export TERM=xterm-256color

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset - Useful for avoiding color bleed

# Initialize autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\[$undpur\][\W]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[$bldblu\] >> \[$txtrst\]"

# Ignore/delete repeated duplicate consecutive commands in history
export HISTCONTROL=erasedups
export HISTSIZE="NOTHING"
export HISTFILESIZE="NOTHING" # no limit
shopt -s histappend # global history
#export PROMPT_COMMAND='history -a'

# ALIASES #
###########
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
#alias mq='/Users/vincentyang/Desktop/IdentityMind/MessageQueue/mq/bin/imqbrokerd -vmargs "-Xms128m -Xmx512m -Xss256k" -name identitymind&'
#alias redis='/Users/vincentyang/Desktop/IdentityMind/Redis/redis-3.0.2/src/redis-server'
#alias mysql='mysql.server start'
#alias mysqle='mysql.server stop'
alias reload='unalias -a && source ~/.bash_profile'
alias aeonneo='cd ~/Dropbox/AeonNeo/'
alias life='cd ~/Dropbox/AeonNeo/Life'
alias dotfiles='cd ~/Dropbox/AeonNeo/dotfiles'
alias projects='cd ~/Dropbox/AeonNeo/Projects'
alias sublime='open /Applications/Sublime\ Text\ 2.app/'
alias now='cd ~/Dropbox/AeonNeo/UC\-Davis/Junior/Spring'
alias bcnc='cd ~/Dropbox/AeonNeo/UC\-Davis/BCNC'
alias dcg='cd ~/Dropbox/AeonNeo/UC\-Davis/DCG'
alias :q='exit'
alias proj='cd ~/Dropbox/AeonNeo/Projects/'
alias bish='cd ~/Dropbox/AeonNeo/Projects/Integrated-Security-Simulation/'
alias wd='pwd'
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias ga='git add .'
alias gm='git mergetool'
#alias vi="vim -S ~/.vimrc"
alias matlab="/Applications/MATLAB_R2015b.app/bin/matlab -nodesktop"
alias hd="cd ~/Dropbox/AeonNeo/UC-Davis/HackDavis/"
alias grad="cd ~/Dropbox/AeonNeo/Career/Grad"
alias digitalo="ssh leaf@162.243.144.114"
alias matloff="cd ~/Dropbox/AeonNeo/UC-Davis/freqparcoord-extension"
alias rs="rscript"
alias p3="python3"
alias rload="echo 'library(freqparcoord.cd, lib.loc = \"~/R/\")' && R CMD INSTALL -l ~/R"
alias y="youtube-dl -i -x --audio-format mp3"
alias clamd="/usr/local/sbin/clamd"

alias tls='tmux list-sessions'
alias ta='tmux a -t'
alias tn='tmux new -s'

# TODO: make this work even in existing tmux session
t() {
    if [ $# -eq 0 ]
    then
        tmux attach -t default || tmux new -s default
    elif [ "$1" = "r" ]
    then
        tmux attach -t research || tmux new -s research
    elif [ "$1" = "w" ]
    then
        tmux attach -t work || tmux new -s work
    elif [ "$1" = "c" ]
    then
        tmux attach -t club || tmux new -s club
    else
        tmux attach -t "$1" || tmux new -s "$1"
    fi
}

tk() {
    if [ "$1" = "d" ]
    then
        tmux kill-session -t default
    elif [ "$1" = "r" ]
    then
        tmux kill-session -t research
    elif [ "$1" = "w" ]
    then
        tmux kill-session -t work
    elif [ "$1" = "c" ]
    then
        tmux kill-session -t club
    else
        echo Nothing to kill!
    fi
}

c() {
    if [ $# -eq 0 ]
    then 
        ls
    else
        cd "$1"
        ls
    fi
}

# Setting PATH for Python 3.4
# # The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
export HISTTIMEFORMAT="%d/%m/%y %T "

export CLICOLOR=1;
#Colors specified here: http://geoff.greer.fm/lscolors/
export LSCOLORS=bxfxcxdxhxegedabagacad
export GREP_OPTIONS='--color=auto'

source `brew --prefix git`/etc/bash_completion.d/git-completion.bash

alias g='git'
# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

# Misc
#copy output of last command to clipboard
alias cl="fc -e -|pbcopy"

# top
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# DNS (with update thanks to @blanco)
alias flush="sudo killall -HUP mDNSResponder"

# share history between terminal sessions
alias he="history -a" # export history
alias hi="history -n" # import history

# Get your current public IP
alias ip="curl icanhazip.com"

# ls better
alias la="ls -aF"
alias ld="ls -ld"
alias ll="ls -lh"
alias lt='ls -At1 && echo "------Oldest--"'
alias ltr='ls -Art1 && echo "------Newest--"'

# mount all connected Firewire disks
alias mountall='system_profiler SPFireWireDataType | grep "BSD Name: disk.$" | sed "s/^.*: //" | (while read i; do /usr/sbin/diskutil mountDisk $i; done)'
# unmount them all
alias unmountall='system_profiler SPFireWireDataType | grep "BSD Name: disk.$" | sed "s/^.*: //" | (while read i; do /usr/sbin/diskutil unmountDisk $i; done)'

# recursively delete Dropbox conflicted files
alias rmdbc="find . -name *\ \(*conflicted* -exec rm {} \;" 

# mute the system volume
alias stfu="osascript -e 'set volume output muted true'"

# time machine log
alias tmlog="syslog -F '\$Time \$Message' -k Sender com.apple.backupd-auto -k Time ge -30m | tail -n 1"

# list TODO/FIX lines from the current project
alias todos="ack -n --nogroup '(TODO|FIX(ME)?):'"

# interactive fasd
#alias zi="fasd -e cd -i"

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/Applications/SWI-Prolog.app/Contents/MacOS:$PATH"

_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # If the file is text, pretty print with rougify. Otherwise, notify of invalid (binary) file.
  # rougify is using theme base16.solarized.dark, which is set in .rvm/gems/ruby-2.3.0/gems/rouge-2.0.7/lib/rouge
  # rougify is faster than coderay and pygmentize
  export FZF_DEFAULT_OPTS="--height 40% --color fg:124,bg:-1,hl:$orange,fg+:15,bg+:52,hl+:231,info:$base00,prompt:196,spinner:208,pointer:196,marker:208 
  --preview '(if file {} | grep -q text; then rougify {} 2> /dev/null; else echo Invalid File Type; fi)'
  --reverse
  "
}
_gen_fzf_default_opts

# Make FZF red colorscheme
alias f="fzf"
# Will return non-zero status if the current directory is not managed by git

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}
fzf-down() {
  fzf --height 50% "$@" --border
}

gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(magenta) %ar %C(cyan)%h%C(green)%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="/usr/local/opt/openssl/bin:$PATH"
