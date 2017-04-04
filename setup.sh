#!/bin/bash


dir=~/Dropbox/AeonNeo/dotfiles                    # dotfiles directory

rm ~/.vimrc
rm ~/.bash_profile
rm ~/.editrc
rm ~/.bashrc
rm ~/.tmux.conf
rm ~/.inputrc
rm ~/.tigrc.vim
rm ~/.tigrc

ln -s $dir/.vimrc ~/.vimrc
ln -s $dir/.bash_profile ~/.bash_profile
ln -s $dir/.editrc ~/.editrc
ln -s $dir/.bashrc ~/.bashrc
ln -s $dir/.tmux.conf ~/.tmux.conf
ln -s $dir/.inputrc ~/.inputrc
ln -s $dir/.tigrc.vim ~/.tigrc.vim
ln -s $dir/.tigrc ~/.tigrc
