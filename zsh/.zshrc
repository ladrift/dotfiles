# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nicoulaj"
#ZSH_THEME="mrtazz"
#ZSH_THEME="mh"
#ZSH_THEME="daveverwer"
#ZSH_THEME="ladrift"
#ZSH_THEME="gitsome"
#ZSH_THEME="risto"
#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew brew-cask atom pip python ipython sudo z zsh-syntax-highlighting tmux)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Vi mode
bindkey -v
# Paths for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Development
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
# z startup
. $ZSH/plugins/z/z.sh
# virtualenvwrapper aliases
alias wk=workon
alias rmv=rmvirtualenv
alias lsv=lsvirtualenv
alias mkv=mkvirtualenv
alias mkp=mkproject

# rewrite default `lsa` alias
alias lsa='ls -a'
# pip: update all packages
alias pip2up='pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip2 install -U'
alias pip3up='pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U'
alias pipup='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U'

# sublime cli
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

## Useful function from Quora(http://www.quora.com/What-are-some-of-the-best-command-prompt-or-terminal-tricks)
# Easily extract all compressed file types
extract () {
   if [ -f "$1" ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf -- "$1"    ;;
           *.tar.gz)    tar xvzf -- "$1"    ;;
           *.bz2)       bunzip2 -- "$1"     ;;
           *.rar)       unrar x -- "$1"     ;;
           *.gz)        gunzip -- "$1"      ;;
           *.tar)       tar xvf -- "$1"     ;;
           *.tbz2)      tar xvjf -- "$1"    ;;
           *.tgz)       tar xvzf -- "$1"    ;;
           *.zip)       unzip -- "$1"       ;;
           *.Z)         uncompress -- "$1"  ;;
           *.7z)        7z x -- "$1"        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file"
   fi
}
## Compile C code from command line
go_libs="-lm"
go_flags="-g -Wall -include allheads.h -O3"
alias go_c="clang -std=c99 -xc '-' $go_libs $go_flags"

## add MacTex binary to `PATH`
eval `/usr/libexec/path_helper -s`

## add Golang path
export GOPATH=$HOME/Development/golang_work

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use `ag` replace fzf's default `find`
export FZF_DEFAULT_COMMAND='ag -g ""'
