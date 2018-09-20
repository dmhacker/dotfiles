
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

# fix wide symbols by adding a space after them
GEOMETRY_SYMBOL_GIT_DIRTY="⬡ "
GEOMETRY_SYMBOL_GIT_CLEAN="⬢ "
GEOMETRY_SYMBOL_GIT_BARE="⬢ "

# adjust prompt colors 
GEOMETRY_COLOR_PROMPT="green"               
GEOMETRY_COLOR_EXIT_VALUE="red"
GEOMETRY_COLOR_ROOT="yellow"                   

# display last execution time in the rprompt
PROMPT_GEOMETRY_EXEC_TIME=true

# load auto-generated antibody plugins file
source ~/.zsh_plugins.sh

# load user configuration files
for config (~/.zsh/*.zsh) source $config

# load local configuration file
local_zshrc="$HOME/.zshrc.local"
if [[ -f $local_zshrc ]]; then
  source $local_zshrc
fi
