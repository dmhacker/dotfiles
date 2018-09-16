#  _____                           _   
# |  __ \                         | |  
# | |__) | __ ___  _ __ ___  _ __ | |_ 
# |  ___/ '__/ _ \| '_ ` _ \| '_ \| __|
# | |   | | | (_) | | | | | | |_) | |_ 
# |_|   |_|  \___/|_| |_| |_| .__/ \__|
#                           | |        
#                           |_|        
function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#           _ _                     
#     /\   | (_)                    
#    /  \  | |_  __ _ ___  ___  ___ 
#   / /\ \ | | |/ _` / __|/ _ \/ __|
#  / ____ \| | | (_| \__ \  __/\__ \
# /_/    \_\_|_|\__,_|___/\___||___/
#
alias ls="ls --color"

# _                     _ 
# | |                   | |
# | |     ___   ___ __ _| |
# | |    / _ \ / __/ _` | |
# | |___| (_) | (_| (_| | |
# |______\___/ \___\__,_|_|
#
local_file="$HOME/.bashrc.local"
if [ -f "$local_file" ]; then
  source "$local_file" 
fi
