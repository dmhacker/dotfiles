
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
# 
# Author: David Hacker <dmhacker@protonmail.com>

ZSHHOME="${ZSHHOME:-$HOME}"

# load autocompletion system
autoload -Uz compinit
compinit -u

# load user configuration files before antibody 
for config ($ZSHHOME/.zsh/configs/*.zsh) source $config

# load auto-generated antibody file
source "$ZSHHOME/.zsh_plugins.sh"

# load local configuration file
local_zshrc="$ZSHHOME/.zshrc.local"
if [[ -f $local_zshrc ]]; then
  source $local_zshrc
fi

if [[ $ZSHHOME != $HOME ]]; then
    user_local_zshrc="$HOME/.zshrc.local"
    if [[ -f $user_local_zshrc ]]; then
        source $user_local_zshrc
    fi
fi
