#!/bin/bash

# Install powerline for the current user 
# pip install --user git+git://github.com/powerline/powerline
git clone https://github.com/powerline/powerline.git
cd powerline
python setup.py install --user
cd ..
rm -rf powerline
if [ -e ~/.profiledankfiles ]; then 
  echo "Mod file found: ~/.local/bin already added to .profile"  
else
  echo "Modifying .profile to include ~/.local/bin ..."
  echo -e "\n# Add local binaries to PATH" >> ~/.profile
  echo -e "if [ -d \"\$HOME/.local/bin\" ]; then" >> ~/.profile
  echo -e "\tPATH=\"\$HOME/.local/bin:\$PATH\"" >> ~/.profile 
  echo -e "fi" >> ~/.profile
  touch ~/.profiledankfiles
fi

# Install powerline fonts for the current user 
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Install powerline globally (default = off)
# sudo apt-get install powerline
# sudo apt-get install fonts-powerline

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

