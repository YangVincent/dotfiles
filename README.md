#### Files:

* [bash_profile](./.bash_profile)
  * This configures my bash command line
* [bashrc](./.bashrc)
* [gitignore_global](./.gitignore_global)
  * The gitignore file tells git which files to ignore (class files, etc)
  * gitignore_global applies to every git folder that does not have a gitignore.
  * ````    git config --global core.excludesfile ~/.gitignore_global ````
* [ideavimrc](./.ideavimrc)
* [killwindow.sh](./.killwindow.sh)
* [tmux.conf](./.tmux.conf)
  * Tmux is a window pane manager
  * This configures said manager
  * Default key remapped to ctrl-a; couples with Karabiner to make caps key default prefix. 
* [vimrc](./.vimrc)
  * The vimrc file defines behaviors and customizations for vi and vim
  * Plugins:
    * Vundle - Vim Plugin Manager
    * vim-fugitive - Git Wrapper
    * YouCompleteMe - Code Completion
    * syntastic - syntax checker
    * auto-pairs - Bracket/Parens/etc auto format and auto matcher
    * nerdcommenter - Easy Commenting
* [xvimrc](./.xvimrc)
  * This is XVim, XCode's vim plugin's customization file
* [input.ini](./input.ini)

![dotfiles logo][logo]

[logo]: https://github.com/YangVincent/dotfiles/blob/master/dotfiles-logo.png
