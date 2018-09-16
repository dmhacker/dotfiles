
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
# 
# Author: David Hacker <dmhacker@protonmail.com>

# set up zsh completion, needed by plugins
autoload -Uz compinit 
compinit

# load auto-generated antibody plugins file
source ~/.zsh_plugins.sh

# load additonal user configuration files
for config (~/.zsh/*.zsh) source $config

# load local user configuration file
local_zshrc="$HOME/.local.zshrc"
if [[ -f $local_zshrc ]]; then
  source $local_zshrc 
fi
