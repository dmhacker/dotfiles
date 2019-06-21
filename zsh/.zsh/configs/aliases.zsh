alias vimconfig="vim ~/.vimrc"
alias vimupdate="vim +PluginInstall +qall"
alias viminstall="git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vimupdate"

alias zshconfig="vim ~/.zshrc"
alias zshplugins="vim ~/.zsh_plugins.txt"
alias zshupdate="/home/dhacker1/antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh"

alias venvrun="source venv/bin/activate"

alias surfacesign="sudo sbsign --key ~/.secboot/mok/MOK.key --cert ~/.secboot/mok/MOK.crt --output /boot/vmlinuz-linux-surface /boot/vmlinuz-linux-surface" 
alias surfaceverify="sbverify --cert ~/.secboot/mok/MOK.crt /boot/vmlinuz-linux-surface" 

alias optirun="vblank_mode=0 optirun"
alias primusrun="vblank_mode=0 primusrun"

alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -l"
alias lla="ls -lA"
