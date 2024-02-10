setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

unsetopt beep

export LANG=en_US.UTF-8

export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search


eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

alias conf='cd ~/.config/'
alias batow="cd /mnt/d"

export EDITOR=/snap/bin/nvim
alias vim="/snap/bin/nvim"

alias rusty="cd dev/hello-rust/ && tmux new -s rusty"
alias aoc="cd ~/dev/advent-of-rust-23/ && tmux new -s aoc"

