# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="flazz"
ZSH_THEME="evan"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="dieter"
# ZSH_THEME="dogenpunk"
# ZSH_THEME="eastwood"
# ZSH_THEME="frisk"
# ZSH_THEME="jreese"
# ZSH_THEME="mortalscumbag"
# ZSH_THEME="tjkirch"
# ZSH_THEME="candy"
# ZSH_THEME="flazz"
# ZSH_THEME="afowler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git zsh-autosuggestions)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

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

setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
setopt HIST_SAVE_NO_DUPS        # When writing out the history file, older commands that duplicate newer ones are omitted.

# bindkey -v
bindkey '^[' vi-cmd-mode
bindkey "^R" history-incremental-search-backward
bindkey '^P' up-history
bindkey '^N' down-history
# by default it is vi behavior, not vim. backspace cannot work as normal
# switch from command mode to insert mode
# bindkey "^W" backward-kill-word    # vi-backward-kill-word
# bindkey "^H" backward-delete-char  # vi-backward-delete-char
# bindkey "^U" backward-kill-line    # vi-kill-line
# bindkey "^?" backward-delete-char  # vi-backward-delete-char

# ESC to normal mode, v to use vim to edit command
export VISUAL=vim
autoload edit-command-line
zle -N edit-command-line
#bindkey -M vicmd v edit-command-line
# or emacs style: C-x C-e to edit
bindkey "^X^E" edit-command-line

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND='ag -g ""'
#bindkey "^F" fzf-cd-widget

# ls color change to solarized
eval `dircolors ~/.dir_colors/dircolors.ansi-dark`

# auto suggestion
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

