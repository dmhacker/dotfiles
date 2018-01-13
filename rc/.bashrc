
# Add local binaries to PATH
# This is duplicated from .profile (TODO: fix hacky solution)
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Set terminal color format
export TERM="xterm-256color"
export LANG="en_US.UTF-8" 

# Configure powerline for the user
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
  source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
