
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

# load auto-generated antibody plugins file
source ~/.zsh_plugins.sh

# load user configuration files
for config (~/.zsh/*.zsh) source $config
