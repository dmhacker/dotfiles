# ls should automatically display with color
alias ls="ls --color"

# Set terminal type
export TERM="rxvt-unicode-256color"

# Enable powerline-shell 
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
