#source ~/.profile

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

# Ignore repeated duplicate consecutive commands in history
export HISTCONTROL=ignoredups

# ALIASES #
###########
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
#alias mq='/Users/vincentyang/Desktop/IdentityMind/MessageQueue/mq/bin/imqbrokerd -vmargs "-Xms128m -Xmx512m -Xss256k" -name identitymind&'
#alias redis='/Users/vincentyang/Desktop/IdentityMind/Redis/redis-3.0.2/src/redis-server'
#alias mysql='mysql.server start'
#alias mysqle='mysql.server stop'
alias reload='unalias -a && source ~/.bash_profile'
alias aeonneo='cd ~/Dropbox/AeonNeo/'
alias davis='cd ~/Dropbox/AeonNeo/UC\ Davis/'
alias life='cd ~/Dropbox/AeonNeo/Life'
alias dotfiles='cd ~/Dropbox/AeonNeo/dotfiles'
alias projects='cd ~/Dropbox/AeonNeo/Projects'
alias sublime='open /Applications/Sublime\ Text\ 2.app/'
alias now='cd ~/Dropbox/AeonNeo/UC\-Davis/Junior/Winter'
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
#alias vi="vim -S ~/.vimrc"
alias matlab="/Applications/MATLAB_R2015b.app/bin/matlab -nodesktop"
alias hd="cd ~/Dropbox/AeonNeo/UC-Davis/HackDavis/"
alias grad="cd ~/Dropbox/AeonNeo/UC-Davis/Grad"
alias digitalo="ssh leaf@162.243.144.114"
alias matloff="cd ~/Dropbox/AeonNeo/UC-Davis/freqparcoord-extension"
alias rs="rscript"
alias p3="python3"
alias lisps="sbcl --script"
alias lisp="sbcl"
alias rload="echo 'library(freqparcoord.cd, lib.loc = \"~/R/\")' && R CMD INSTALL -l ~/R"

alias tls='tmux list-sessions'
alias ta='tmux a -t'
alias tn='tmux new -s'

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
