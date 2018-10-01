
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

# fix wide symbols by adding a space after them
GEOMETRY_SYMBOL_GIT_DIRTY="⬡ "
GEOMETRY_SYMBOL_GIT_CLEAN="⬢ "
GEOMETRY_SYMBOL_GIT_BARE="⬢ "

# adjust prompt colors 
GEOMETRY_COLOR_PROMPT="magenta"               
GEOMETRY_COLOR_EXIT_VALUE="red"
GEOMETRY_COLOR_ROOT="yellow"                   

# add these sections to the rprompt 
PROMPT_GEOMETRY_EXEC_TIME=true
PROMPT_GEOMETRY_GIT_CONFLICTS=true

# remove these sections from the rprompt 
PROMPT_GEOMETRY_GIT_TIME=false

# load auto-generated antibody file
source ~/.zsh_plugins.sh

# load third-party plugin files after antibody 
for plugin (~/.zsh/plugins/*.zsh) source $plugin

# load local configuration file
local_zshrc="$HOME/.zshrc.local"
if [[ -f $local_zshrc ]]; then
  source $local_zshrc
fi
