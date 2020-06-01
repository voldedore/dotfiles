# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="${PATH}:$HOME/bin"

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Golang PATH (GOPATH)
export GOPATH=~/Projects/Golang

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="custom-powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting git-flow-completion yarn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="vim"
alias ll="ls -alh"
alias l="ls -lh"
alias zup="xrdb ~/.Xresources"
alias config='/usr/bin/git --git-dir=$HOME/Projects/dotfiles/.git/ --work-tree=$HOME'
alias pwa='cd /run/media/thevinh/WORKS/PROJECTS/VNPT/00.SRC/pwa-his'
alias notes='cd ~/Projects/notes'
alias dotfiles='cd ~/Projects/dotfiles'

#
# ### Prompt components
# # Each component will draw itself, and hide itself if no information needs to be shown
#
# # Context: user@hostname (who am I and where am I)

DEFAULT_USER=admin
 prompt_context() {
   local user=`whoami`

     if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
#         prompt_segment black default " %(!.%{%F{yellow}%}.)$user@%m "
           fi
           }

# Powerlevel9k theme customizations
# NOTE: This is applied only to powerlevel9k theme
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX='‣ '
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Dir colors
eval `dircolors ~/.dir_colors/dircolors.256dark`
export TERM=rxvt-unicode-256color

eval $(thefuck --alias)

# umask 077 this will set mode 7 for owners, 0, 0 for group and other. (chmod 700 default for creating new files)
umask 077

