# Set the directory we want to store zinit and plugins.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet.
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit.
source "${ZINIT_HOME}/zinit.zsh"

# Plugins.
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions.
autoload -U compinit && compinit

# Keybindings.
bindkey -e # emacs mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History.
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

PROMPT="[%n@%m:%~]$ "

# Completions styling.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Zoxide.
eval "$(zoxide init --cmd cd zsh)"

# Shell integrations.
eval "$(fzf --zsh)"

# Alias.
alias "vim"=nvim
alias "zed"=zeditor
alias ls="ls --color=auto"
alias hx="helix"
alias pt="project-tracker"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go path
export PATH="$PATH:/home/mister/go/bin:$PATH"

# Doom emacs
export PATH="$PATH:/home/mister/.config/emacs/bin:$PATH"

# Project tracker
export PATH="$PATH:/home/mister/code/project-tracker/target/debug:$PATH"

# Zigoso
export PATH="$PATH:/home/mister/software/zig-linux-x86_64-0.14.0::$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export EDITOR=zeditor

# Move by word with arrow keys 
bindkey ";5C" forward-word
bindkey ";3C" forward-word
bindkey ";5D" backward-word
bindkey ";3D" backward-word

. "$HOME/.limbo/env"
export PATH=/usr/bin:$PATH

# bun completions
[ -s "/home/mister/.bun/_bun" ] && source "/home/mister/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/mister/.lmstudio/bin"

# Turso
export PATH="$PATH:/home/mister/.turso"

# pnpm
export PNPM_HOME="/home/mister/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
