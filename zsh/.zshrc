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
tmux source-file ~/config_files/tmux/.tmux.conf
alias kill_sessions_tmux="tmux kill-session -a"

#------------------------------------------------------------------------------------
#vim mode
#bindkey -v
#export KEYTIMEOUT=1
#------------------------------------------------------------------------------------
bindkey '^[[Z' reverse-menu-complete
#------------------------------------------------------------------------------------

xset r rate 250 45
xrdb ~/.Xresources

# records the location of the current directory
function cd() {
	new_directory="$*";
	if [ $# -eq 0 ]; then 
		new_directory=${HOME};
	fi;
	builtin cd "${new_directory}" && pwd > /tmp/whereami
}

function recordpath() {
    builtin pwd > /tmp/whereami
}

zle -N recordpath
bindkey '^b' recordpath

VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR
export LD_LIBRARY_PATH="/usr/local/lib/"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export PATH="$PATH:$HOME/Downloads/flutter/bin"
export PATH="$PATH:$HOME/Downloads/flutter/bin/cache/dart-sdk/bin"
# softwares
alias vim="nvim"
alias zathura='foo(){zathura "$1"&!}; foo '
alias feh='foo(){feh --scale-down --auto-zoom "$1" .}; foo '
alias popcorn='~/Downloads/popcorn/Popcorn-Time'
alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3'
# git related
alias gitupdate='foo(){ git add -A; git commit -m "$1"; git push origin master}; foo '
alias git_origin_head='foo(){ git fetch origin; git reset --hard master}; foo '
alias git_show='foo(){ python2 ~/config_files/system_files/gitshow.py "$1"}; foo '
alias git_log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# tasks
alias create_cpp_project='python2 ~/config_files/cpp/organized_cpp_project.py'
alias create_notes='python2 ~/config_files/latex/setup_notes.py'
# commands
alias tree="tree -hF"
alias null='/dev/null 2>&1'
alias enable_touchpad="xinput enable 14"
alias disable_touchpad="xinput disable 14"
# file(or)directory pointers
alias opengl='cd ~/workarea/graphics_work/advanced_opengl/'
alias notes="cd ~/Dropbox/study/2019/"
alias tasklist="vim ~/Dropbox/tasklist/tasklist.txt"
