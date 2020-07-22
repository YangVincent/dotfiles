PROMPT='%F{blue}%1~%f %# '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://github.com/pypa/pip/issues/5063
function p3() {
   pip3 "${@:1}" --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org
}
  
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
