
# If we are using a non-login shell, .profile won't be loaded
# This means powerline won't be recognized by bash.
# To get around this, we add .local/bin to $PATH if we know
# that we are using a non-login shell
if [ $(echo $0) = "bash" ]; then
  if [ -d "$HOME/.local/bin" ]; then
	  PATH="$HOME/.local/bin:$PATH"
  fi 
fi

# Set terminal color format
export TERM="screen-256color"
export LANG="en_US.UTF-8" 

# Configure powerline for the user
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
  source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
