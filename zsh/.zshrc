# in case of problems with locale
# sudo locale-gen en_US en_US.UTF-8
# sudo dpkg-reconfigure locales
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export XDG_CONFIG_HOME=$HOME/.config/

export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=Hyprland

# get rid of the stupid beep
unsetopt beep

export TERM=screen-256color

# make nvim the default editor
export EDITOR=nvim
export GIT_EDITOR=nvim

# keep previous commands in history
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# key bindings to cycle through history
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# setopt prompt_subst
# load autocomplete
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# style autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# key bindings for autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^f' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# clear screen with '^L' like in bash
function clear-screen-and-scrollback() {
builtin echoti civis >"$TTY"
builtin print -rn -- $'\e[H\e[2J' >"$TTY"
builtin zle .reset-prompt
builtin zle -R
builtin print -rn -- $'\e[3J' >"$TTY"
builtin echoti cnorm >"$TTY"
}
zle -N clear-screen-and-scrollback
bindkey '^L' clear-screen-and-scrollback


# path
CORE_PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin
CARGO_PATH=$HOME/.cargo/bin
GO_PATH=$HOME/go/bin:/usr/local/go/bin
ZIG_PATH=$HOME/.zig
BUN_PATH=$HOME/.bun/bin
export BUN_INSTALL="$HOME/.bun"
BUN_PATH="$BUN_INSTALL/bin"
PROJ_PATH=$HOME/bin/scripts:$HOME/bin/projects

export PATH=$PATH:$CORE_PATH:$CARGO_PATH:$GO_PATH:$ZIG_PATH:$BUN_PATH:$PROJ_PATH

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

# fzf
# source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --cmd cd removes the need to alias cd to z
eval "$(zoxide init --cmd cd zsh)"

# ocaml
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/joeldotdias/.bun/_bun" ] && source "/home/joeldotdias/.bun/_bun"

#aliases
alias conf="cd ~/.dotfiles/"

alias batow="cd /mnt/d"

alias vi="/usr/bin/vim"
alias vim="nvim"

alias rusty="(cd ~/learn/rust/hello-rust; tmux new -s rusty)"
alias crust="(cd ~/learn/rust/crust-of-rust; tmux new -s crust)"
alias lings="(cd ~/learn/rust/hello-rust/rustlings; tmux new -s lings)"
alias aoc="(cd ~/learn/aoc/advent-of-rust-23/; tmux new -s aoc)"

alias python="python3"
