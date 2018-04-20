#!/bin/bash

# Home directory of current user (will have to be re-configured for root)
homedir=$HOME

# Current directory that this script is in
sourcedir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Special case where the script is being run as r oot
if [ "$EUID" -eq 0 ]; then
  # Install powerline
  sudo apt-get install powerline
  sudo apt-get install fonts-powerline

  # Prompt user if we should proceed with root installation
  echo -e "\nYou are running this script as the root user."
  echo "If you proceed, configuration files will be installed for root."
  read -p "Do you want to continue? [Y/n] " confirm

  # Proceed if answer is "y" or "yes" (case-insensitive), otherwise exit
  shopt -s nocasematch
  if [ "$confirm" = "y" ] || [ "$confirm" = "yes" ]; then
    shopt -u nocasematch
  else
    exit 0
  fi
fi

# Copy configuration files from rc/ to $HOME
shopt -s dotglob # Enable bash to read hidden files
for filepath in $sourcedir/rc/*
do
  # The full path to a configuration file in rc/
  fullpath="$(realpath $filepath)"

  # The installation path of the configuration file
  mainpath="$HOME/$(basename $filepath)"

  echo "------------------------------------------------------------------------------------"
  echo "Installing ... $filepath"

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