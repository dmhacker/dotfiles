
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
# 
# Author: David Hacker <dmhacker@protonmail.com>

############# ZINIT ############# 

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

############# VARIABLES #############

export LS_COLORS='no=00;37:fi=01;34:rs=00;37:di=00;34:ln=00;36:mh=00;37:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=00;05;37;41:mi=00;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=04;34:st=37;44:ex=00;32:*.cmd=00;33:*.exe=00;33:*.com=00;33:*.btm=00;33:*.bat=00;33:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz=01;31:*.bz2=01;31:*.bzip2=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.apk=01;31:*.gem=01;31:*.jpg=00;35:*.JPG=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:*.svgz=00;35:*.mng=00;35:*.pcx=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.yuv=00;35:*.cgm=00;35:*.emf=00;35:*.eps=00;35:*.CR2=00;35:*.ico=00;35:*.pdf=00;32:*.ps=00;32:*.txt=00;32:*.html=00;32:*.css=00;32:*.rst=00;32:*.md=00;32:*.patch=00;32:*.diff=00;32:*.tex=00;32:*.xls=00;32:*.xlsx=00;32:*.doc=00;32:*.docx=00;32:*.ppt=00;32:*.pptx=00;32:*.key=00;32:*.ods=00;32:*.odt=00;32:*.pt=01;32:*.tmpl=01;32:*.in=01;32:*.ots=01;32:*.ott=01;32:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.m4a=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:*.mov=01;36:*.mpg=01;36:*.mpeg=01;36:*.m2v=01;36:*.mkv=01;36:*.ogm=01;36:*.mp4=01;36:*.m4v=01;36:*.mp4v=01;36:*.vob=01;36:*.qt=01;36:*.nuv=01;36:*.wmv=01;36:*.asf=01;36:*.rm=01;36:*.rmvb=01;36:*.flc=01;36:*.avi=01;36:*.fli=01;36:*.flv=01;36:*.gl=01;36:*.m2ts=01;36:*.divx=01;36:*.webm=01;36:*.axv=01;36:*.anx=01;36:*.ogv=01;36:*.ogx=01;36:*.conf=00;36:*.config=00;36:*.cnf=00;36:*.cfg=00;36:*.ini=00;36:*.properties=00;36:*.yaml=00;36:*.vcl=00;36:*.c=00;33:*.cpp=00;33:*.py=00;33:*.coffesscript=00;33:*.js=00;33:*.rb=00;33:*.sh=00;33:*.zsh=00;33:*.env=00;33:*.bash=00;33:*.php=00;33:*.java=00;33:*.zcml=00;33:*.pl=00;33:*.lua=00;33:*.clj=00;33:*.cs=00;33:*.fs=00;33:*.fsx=00;33:*.go=00;33:*.db=00;32:*.sql=00;32:*.json=00;32:*.plist=00;32:*.xml=00;32:*.tex=01;37:*.rdf=01;37:*.owl=01;37:*.n3=01;37:*.ttl=01;37:*.nt=01;37:*.torrent=01;37:*.xml=01;37:*Makefile=01;37:*makefile=01;37:*Rakefile=01;37:*build.xml=01;37:*rc=01;37:*.nfo=01;37:*README=01;37:*README.txt=01;37:*readme.txt=01;37:*README.markdown=01;37:*README.md=01;37:*.cc=01;37:*.log=01;30:*.bak=01;30:*.aux=01;30:*.lof=01;30:*.lol=01;30:*.lot=01;30:*.out=01;30:*.toc=01;30:*.bbl=01;30:*.blg=01;30:*~=01;30:*#=01;30:*.part=01;30:*.incomplete=01;30:*.swp=01;30:*.tmp=01;30:*.temp=01;30:*.o=01;30:*.obj=01;30:*.pyc=01;30:*.pyo=01;30:*.class=01;30:*.cache=01;30:*.egg-info=01;30:';

# History setup taken from oh-my-zsh's library
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Set up default golang environment variables if installed
if which go > /dev/null 2>&1; then
    GOPATH=$(go env GOPATH)
    GOROOT=$(go env GOROOT)
    PATH="$PATH:$GOPATH/bin"
fi

############# ALIASES ############# 

alias vimconfig="vim ~/.vimrc"
alias viminstall="git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vimupdate"
alias vimupdate="vim +PluginInstall +qall"

alias zshconfig="vim ~/.zshrc"
alias zshupdate="zinit self-update; zinit update --all --parallel"

alias venvrun="source venv/bin/activate"

alias surfacesign="sudo sbsign --key ~/.secboot/mok/MOK.key --cert ~/.secboot/mok/MOK.crt --output /boot/vmlinuz-linux-surface /boot/vmlinuz-linux-surface" 
alias surfaceverify="sbverify --cert ~/.secboot/mok/MOK.crt /boot/vmlinuz-linux-surface" 

alias optirun="vblank_mode=0 optirun"
alias primusrun="vblank_mode=0 primusrun"

alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -l"
alias lla="ls -lA"

############# PLUGINS ############# 

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# Selectively loading the fzf plugin fixes an OMZ warning message
if command -v fzf > /dev/null 2>&1; then
    export FZF_BASE="/usr/share/fzf"
    zinit wait lucid for \
        OMZ::plugins/fzf/fzf.plugin.zsh
fi

zinit wait lucid for \
    OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/nvm/nvm.plugin.zsh \
    OMZ::plugins/golang/golang.plugin.zsh \
    jeffreytse/zsh-vi-mode \
    djui/alias-tips \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf \
        zsh-users/zsh-completions \
        zimfw/completion

############# LOCAL FILES ############# 

local_zshrc="$HOME/.zshrc.local"
if [[ -f $local_zshrc ]]; then
  source $local_zshrc
fi
