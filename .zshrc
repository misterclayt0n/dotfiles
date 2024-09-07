# homebrew stuff
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# set directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"


# theme
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/ying-yang.toml)"

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# load completions
autoload -U compinit && compinit

# keybindings
bindkey -e # emacs mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# history
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

# completions styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# shell integrations
eval "$(fzf --zsh)"

# alias
alias "vim"=nvim
alias "lzd"=lazydocker
alias "l"="ls -l"
alias "focus"=focus-linux

# zed? i supppose?
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/software/:$PATH
export PATH=$HOME/software/zig-linux-x86_64-0.14.0-dev.1417+242d268a0/:$PATH
# export PATH=$HOME/software/zig-linux-x86-0.13.0/:$PATH
export PATH=$HOME/software/zls/zig-out/bin/:$PATH
export PATH=$HOME/software/quarto-1.5.55/bin/:$PATH
export PATH=$HOME/software/:$PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.config/emacs/bin/
export CC_wasm32_wasi="/opt/wasi-sdk/bin/clang"
export CFLAGS_wasm32_wasi="--sysroot=/opt/wasi-sdk/share/wasi-sysroot"
export LDFLAGS_wasm32_wasi="-L/opt/wasi-sdk/lib/clang/16.0.0/lib/wasi/"
export PATH=/home/mister/.surrealdb:$PATH



# bun completions
[ -s "/home/mister/.bun/_bun" ] && source "/home/mister/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export LLVM_CONFIG_PATH=/usr/bin/llvm-config
export LIBCLANG_PATH=/usr/lib64/libclang.so

# Turso
export PATH="$PATH:/home/mister/.turso"

# jujutsu
autoload -U compinit
compinit
source <(jj util completion zsh)

# Odin
export PATH="$PATH:/home/mister/software/Odin:$PATH"

# boomer
export PATH="$PATH:/home/mister/software/boomer:$PATH"
