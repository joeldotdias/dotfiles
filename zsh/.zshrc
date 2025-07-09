# get rid of the stupid beep
unsetopt beep

# keep previous commands in history
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE

# key bindings to cycle through history
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# load autocomplete
autoload -Uz compinit && compinit

# style autocomplete
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# key bindings for autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
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


# starship
eval "$(starship init zsh)"

# fzf
source <(fzf --zsh)

# --cmd cd removes the need to alias cd to z
eval "$(zoxide init --cmd cd zsh)"

# ocaml
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null

#aliases
alias conf="cd ~/.dotfiles/"
alias vi="/usr/bin/vim"
alias vim="nvim"

alias python="python3"

export NVM_DIR="$HOME/.config//nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
