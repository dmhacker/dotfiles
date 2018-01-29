#!/bin/bash

# Install powerline globally 
sudo apt-get install powerline
sudo apt-get install fonts-powerline

# Create symlinks from rc/ to ~/
shopt -s dotglob # Enable bash to read hidden files
for filepath in rc/*
do
  abspath="$(realpath $filepath)" # The file that the symlink points to
  copytopath="$HOME/$(basename $filepath)" # The symlink itself

  if [ -L $copytopath ]; then
    echo "Unlinking ... $copytopath"
    unlink "$copytopath"
  fi

  echo "Linking ... $abspath -> $copytopath"
  ln -s "$abspath" "$copytopath"
done

# Install vundle + plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

