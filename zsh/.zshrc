# keep previous commands in history for autocomplete
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# get rid of the stupid beep
unsetopt beep

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# in case of problems with locale
# sudo locale-gen en_US en_US.UTF-8
# sudo dpkg-reconfigure locales

export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$HOME/.local/bin:$PATH:/usr/local/go/bin:/snap/bin:$HOME/go/bin:$HOME/bin/scripts

# make nvim the default editor
export EDITOR=/usr/bin/nvim

# autocomplete
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit


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


eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --cmd cd removes the need to alias cd to z
eval "$(zoxide init --cmd cd zsh)"

# aliases
source ~/.zsh_aliases
