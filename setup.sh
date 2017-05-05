#!/bin/bash

dir=~/Dropbox/AeonNeo/dotfiles                    # dotfiles directory

[ -e ~/.vimrc  ] && rm ~/.vimrc
[ -e ~/.bash_profile  ] && rm ~/.bash_profile
[ -e ~/.editrc  ] && rm ~/.editrc
[ -e ~/.bashrc  ] && rm ~/.bashrc
[ -e ~/.tmux.conf  ] && rm ~/.tmux.conf
[ -e ~/.inputrc  ] && rm ~/.inputrc
[ -e ~/.tigrc.vim  ] && rm ~/.tigrc.vim
[ -e ~/.tigrc  ] && rm ~/.tigrc
[ -e ~/Library/Preferences/qutebrowser/keys.conf ] && rm ~/Library/Preferences/qutebrowser/keys.conf
[ -e ~/Library/Preferences/qutebrowser/qutebrowser.conf ] && rm ~/Library/Preferences/qutebrowser/qutebrowser.conf


ln -s $dir/.vimrc ~/.vimrc
ln -s $dir/.bash_profile ~/.bash_profile
ln -s $dir/.editrc ~/.editrc
ln -s $dir/.bashrc ~/.bashrc
ln -s $dir/.tmux.conf ~/.tmux.conf
ln -s $dir/.inputrc ~/.inputrc
ln -s $dir/.tigrc.vim ~/.tigrc.vim
ln -s $dir/.tigrc ~/.tigrc

ln -s $dir/qutebrowser/keys.conf ~/Library/Preferences/qutebrowser/keys.conf
ln -s $dir/qutebrowser/qutebrowser.conf ~/Library/Preferences/qutebrowser/qutebrowser.conf
