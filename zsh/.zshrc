
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
# 
# Author: David Hacker <dmhacker@protonmail.com>

# oh-my-zsh variables
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/dmhacker/.oh-my-zsh"
ZSH_THEME="spaceship"

# oh-my-zsh plugins
plugins=(
  colored-man-pages
  git
  nvm 
  zsh-syntax-highlighting
  vi-mode
)

# oh-my-zsh source script
source $ZSH/oh-my-zsh.sh

# load additonal user configuration files
for config (~/.zsh/*.zsh) source $config

# load local user configuration file
local_zshrc="$HOME/.local.zshrc"
if [[ -f $local_zshrc ]]; then
  source $local_zshrc 
fi
