#!/bin/bash

# Install powerline if running as root
if [ "$EUID" -eq 0 ]; then
  sudo apt-get install powerline
  sudo apt-get install fonts-powerline
else
  echo "Installation script is not being run as root. Cannot install powerline."
fi

# Copy configuration files from rc/ to $HOME
shopt -s dotglob # Enable bash to read hidden files
for filepath in $PWD/rc/*
do
  # The full path to a configuration file in rc/
  fullpath="$(realpath $filepath)"

  # The installation path of the configuration file
  mainpath="$HOME/$(basename $filepath)"

  echo "------------------------------------ $filepath ------------------------------------"

  # Copy file if its counterpart on the home directly does not exist
  # If the overwrite flag (-o) is provided, overwrite the file
  if [ ! -f $mainpath ] || [ "$1" = "-o" ]; then
    echo "Writing to ... $mainpath"
    cp -f $fullpath $mainpath
  else
    echo "Skipping overwrite ... $mainpath"
    echo "File already exists. Please use the -o flag to overwrite."
  fi

done

echo "------------------------------------------------------------------------------------"

# Clone Vundle into the $HOME directory
VUNDLE_REPOSITORY="https://github.com/VundleVim/Vundle.vim.git"
VUNDLE_DIRECTORY="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d $VUNDLE_DIRECTORY ]; then
  git clone "$VUNDLE_REPOSITORY" "$VUNDLE_DIRECTORY"
fi

# Install Vundle plugins
vim +PluginInstall +qall

