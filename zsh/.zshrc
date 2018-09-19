
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

# improve performance by removing unnecessary prompt sections
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  vi_mode       # Vi-mode indicator
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# disable insert mode display on vi-mode prompt section
SPACESHIP_VI_MODE_SUFFIX=""
SPACESHIP_VI_MODE_INSERT=""

# load auto-generated antibody plugins file
source ~/.zsh_plugins.sh

# load user configuration files
for config (~/.zsh/*.zsh) source $config

# load local configuration file
local_zshrc="$HOME/.zshrc.local"
if [[ -f $local_zshrc ]]; then
  source $local_zshrc
fi
