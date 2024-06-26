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
DISABLE_AUTO_UPDATE="true"

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
#export TERM=xterm-256color

#------------------------------------------------------------------------------------
# to use tmux
if command -v tmux>/dev/null; then
	[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
tmux source-file ~/config_files/tmux/.tmux.conf
alias kill_sessions_tmux="tmux kill-session -a"

#------------------------------------------------------------------------------------
bindkey -v
export KEYTIMEOUT=1
#------------------------------------------------------------------------------------
DISABLE_AUTO_UPDATE="true" 
xset r rate 250 45


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
# softwares
#alias vim=nvim
alias notepad="mousepad $1 &!"
alias gvim0="gvim --servername GVIM --remote $1"
alias gvim1="gvim --servername GVIM --remote $1"
alias gvim2="gvim --servername GVIM --remote $1"
alias gvim3="gvim --servername GVIM --remote $1"
alias gvim4="gvim --servername GVIM --remote $1"
alias gvim5="gvim --servername GVIM --remote $1"
alias gvim6="gvim --servername GVIM --remote $1"
alias zathura='foo(){zathura "$1" > /dev/null 2>&1  &!}; foo '
alias feh='foo(){feh --scale-down --auto-zoom "$1" .}; foo '
alias popcorn='~/Downloads/popcorn/Popcorn-Time'
alias python="python3"
# git related
alias gitupdate='foo(){ git add -A; git commit -m "$1"; git push origin master}; foo '
alias git_origin_head='foo(){ git fetch origin; git reset --hard master}; foo '
alias git_show='foo(){ python3 ~/config_files/system_files/gitshow.py "$1"}; foo '
alias git_log="git log --graph --pretty=form %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# tasks
alias create_cpp_project='python3 ~/config_files/cpp/cpp_templates/organized_cpp_project.py'
alias quick_code="cp $HOME/config_files/cpp/cpp_templates/main.cpp . && cp $HOME/config_files/cpp/cpp_templates/makefile ."
alias create_notes='foo(){ mkdir "$1"; cp ~/config_files/latex/main.tex "$1"; cp ~/config_files/latex/Makefile "$1"}; foo '
# commands
alias tree="tree -hF"
alias null='/dev/null 2>&1'
alias tasklist="vim ~/workarea/tasklist.md"
alias 1k="xrandr --output eDP-1 --mode 1920x1200"
alias 2k="xrandr --output DVI-I-1-1 --mode 2560x1440"
