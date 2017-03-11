# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
source ~/.zplug/init.zsh
# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "djui/alias-tips"
zplug "sharat87/pip-app"
zplug "plugins/common-aliases", from:oh-my-zsh
#zplug "b4b4r07/enhancd", of:enhancd.sh
# Load theme file
zplug 'dracula/zsh', as:theme
#zplug 'InAnimaTe/darkblood-modular', as:theme
#zplug "potasiyam/cmder-zsh-theme", as:theme
#zplug "Huvik/Cloudy", as:theme
#zplug "hchbaw/auto-fu.zsh"
zplug "Tarrasch/zsh-autoenv"

## zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
#zplug clean
#zplug clear
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load
#zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes
## Use cache completion
## apt-get, dpkg (Debian), rpm (Redhat), urpmi (Mandrake), perl -M,
## bogofilter (zsh 4.2.1 >=), fink, mac_apps...
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list \
    '' \
    'm:{a-z}={A-Z}' \
    'l:|=* r:|[.,_-]=* r:|=* m:{a-z}={A-Z}'
# sudo completions
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' menu select
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
    _approximate _list _history

autoload -U compinit; compinit -d ~/.zcompdump
ENABLE_CORRECTION="true"
if [ $TERM = "dumb" ]; then
    # Disable colors in GVim
    alias ls="ls -F --show-control-chars"
    alias la='ls -aF --show-control-chars'
    alias ll='ls -lF --show-control-chars'
    alias l.='ls -dF .[a-zA-Z]*'
else
    # Color settings for zsh complete candidates
    alias ls='ls -F --show-control-chars --color=always'
    alias la='ls -aF --show-control-chars --color=always'
    alias ll='ls -lF --show-control-chars --color=always'
    alias l.='ls -dF .[a-zA-Z]* --color=always'
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
fi

# use prompt colors feature
autoload -U colors
colors
#
# List completion
setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
# List like "ls -F"
setopt list_types
# Compact completion
setopt list_packed
setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups
# Check original command in alias completion
#setopt complete_aliases
setopt hist_verify


# My configurations
alias pinglu='ping 172.16.30.30'
alias pingla='ping 172.16.20.2'
alias pingin='ping 172.16.28.11'
alias utk='sshuttle --dns -r utkarsh@172.16.30.30 0/0'
alias shi='sshuttle --dns -r shikhar@172.16.30.20 0/0'
alias vi=nvim
alias cdwin='cd /mnt/win10/Users/Utkarsh'
alias cdlin='cd /mnt/mega/home/utkarsh'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export NVM_DIR="/home/utkarsh/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#source /usr/bin/activate.sh
alias va="source venv/bin/activate"
alias vd="deactivate"
alias sopen="chromium http://localhost:5000"
alias mop="sudo systemctl stop mysqld; sudo systemctl start mysqld; mysql -u root -p"
export GEM_HOME=/home/utkarsh/.gem/ruby/2.4.0
export http_proxy=""
export https_proxy=""
export ftp_proxy=""
export no_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export FTP_PROXY=""
export NO_PROXY=""
