# Path to oh-my-zsh installation.
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:~/.local/bin/

export ZSH=${HOME}/.oh-my-zsh

# THEME CUSTOMIZATION
ZSH_THEME="spaceship"

# Spaceship customization
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "

SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_VI_MODE_INSERT=""
SPACESHIP_VI_MODE_NORMAL="N"
SPACESHIP_VI_MODE_COLOR="magenta"
SPACESHIP_PACKAGE_SHOW=false

SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false

SPACESHIP_GIT_STATUS_UNTRACKED=""
SPACESHIP_GIT_STATUS_COLOR="yellow"
SPACESHIP_GIT_SYMBOL="\UF418 "
SPACESHIP_GIT_BRANCH_COLOR="blue"
SPACESHIP_GIT_STATUS_SUFFIX="]"
SPACESHIP_GIT_STATUS_PREFIX=" ["
SPACESHIP_GIT_SUFFIX=""

SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_PREFIX="."
SPACESHIP_EXEC_TIME_SUFFIX=""
SPACESHIP_EXEC_TIME_ELAPSED="5"

SPACESHIP_DOTNET_SHOW=false

SPACESHIP_PROMPT_ORDER=(
  #time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  #hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  #elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  #rust          # Rust section
  #haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  #pyenv         # Pyenv section
  dotnet        # .NET section
  #ember         # Ember.js section
  kubectl       # Kubectl context section
  #terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  #vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# PLUGINS
plugins=(git zshmarks vi-mode colorize zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# ZSHMARKS config
alias jj="jump"
alias bb="bookmark"
alias bbd="deletemark"
alias bbs="showmarks"

alias pullall="ls | xargs  -I{} git -C {} pull"
alias mux='tmuxinator'

source ~/.zprofile

export EDITOR='vim'

export RPS1="%{$reset_color%}"

#disable ctrl s and ctrl q
stty -ixon

#vim mode
bindkey -v
#export KEYTIMEOUT=1

# autosuggest
#bindkey '^[[A' autosuggest-accept
