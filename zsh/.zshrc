# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="pygmalion"
ZSH_THEME="plain"
#good themes are
#ys
#Soliah
#plain
#frisk

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
plugins=(git)

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
# --------------------------------------------------------------------
xset b off
xrdb ~/.Xresources
force_color_prompt=yes
export TERM=xterm-256color

#------------------------------------------------------------------------------------
# to use tmux
if command -v tmux>/dev/null; then
	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
tmux source-file ~/.tmux.conf
alias kill_sessions_tmux="tmux kill-session -a"

#------------------------------------------------------------------------------------
#vim mode
#bindkey -v
#export KEYTIMEOUT=1
#------------------------------------------------------------------------------------
bindkey '^[[Z' reverse-menu-complete
#------------------------------------------------------------------------------------

xset r rate 250 45
export LD_LIBRARY_PATH="/usr/local/lib/"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
alias vim="nvim"
alias enable_touchpad="xinput enable 14"
alias disable_touchpad="xinput disable 14"
alias zathura='foo(){zathura "$1"&!}; foo '
alias feh='foo(){feh "$1" .}; foo '
alias gitupdate='foo(){ git add -A; git commit -m "$1"; git push origin master}; foo '
alias gitoriginhead='foo(){ git fetch origin; git reset --hard origin/master; foo '
alias tasklist="vim ~/Dropbox/tasklist/tasklist.txt"
alias popcorn='~/Downloads/popcorn/Popcorn-Time'
alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3'
alias cpp_project='python ~/config_files/cpp/organized_cpp_project.py'
alias null='/dev/null 2>&1'

alias opengl='~/workarea/opengl/advanced_opengl/'
