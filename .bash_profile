export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

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
alias mat='ssh m22als3-27@point.math.ucdavis.edu'
alias mgt='/usr/bin/open -a "/Applications/Safari.app" "http://connect.mheducation.com/connect/login/index.htm?&BRANDING_VARIANT_KEY=en_us_default_default&node=connect_app_17_251"'
alias ant='/usr/bin/open -a "/Applications/Safari.app" "https://digital.wwnorton.com/howhumans7"'
alias dsp='cd ~/Dropbox/AeonNeo/UC\ Davis/Sophomore/Winter/DSP'
alias sublime='open /Applications/Sublime\ Text\ 2.app/'
alias now='cd ~/Dropbox/AeonNeo/UC\ Davis/Sophomore/Winter/'
alias dsp='cd ~/Dropbox/AeonNeo/UC\ Davis/DSP'
alias :q='exit'
alias proj='cd ~/Dropbox/AeonNeo/Projects/Materialize/MaterializeYiassuo/'

if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi




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



