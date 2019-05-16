
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
# 
# Author: David Hacker <dmhacker@protonmail.com>

# load autocompletion system
autoload -Uz compinit
compinit

# load user configuration files before antibody 
for config (~/.zsh/configs/*.zsh) source $config

# load auto-generated antibody file
source ~/.zsh_plugins.sh

# load third-party plugin files after antibody 
# for config (~/.zsh/geometry/*.zsh) source $config

# load local configuration file
local_zshrc="$HOME/.zshrc.local"
if [[ -f $local_zshrc ]]; then
  source $local_zshrc
fi
