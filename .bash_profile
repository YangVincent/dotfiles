
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
#alias mq='/Users/vincentyang/Desktop/IdentityMind/MessageQueue/mq/bin/imqbrokerd -vmargs "-Xms128m -Xmx512m -Xss256k" -name identitymind&'
#alias redis='/Users/vincentyang/Desktop/IdentityMind/Redis/redis-3.0.2/src/redis-server'
alias mysql='mysql.server start'
alias mysqle='mysql.server stop'
alias o='ls'
alias vi='vim'
alias aeonneo='cd ~/Dropbox/AeonNeo/'
alias davis='cd ~/Dropbox/AeonNeo/UC\ Davis/'
alias soph='cd ~/Dropbox/AeonNeo/UC\ Davis/Sophomore'
alias life='cd ~/Dropbox/AeonNeo/Life'
alias dotfiles='cd ~/Dropbox/AeonNeo/dotfiles'
alias projects='cd ~/Dropbox/AeonNeo/Projects'





# Setting PATH for Python 3.4
# # The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
bind -m vi-insert '"jk":"\e"' 
export HISTTIMEFORMAT="%d/%m/%y %T "

export CLICOLOR=1;
#Colors specified here: http://geoff.greer.fm/lscolors/
export LSCOLORS=bxfxcxdxhxegedabagacad
export GREP_OPTIONS='--color=auto'



