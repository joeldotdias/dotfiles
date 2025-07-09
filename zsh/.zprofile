export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=Hyprland

export TERM=screen-256color

# make nvim the default editor
export EDITOR=nvim
export GIT_EDITOR=nvim

export SDL_VIDEODRIVER=wayland

export GOPATH=$HOME/.go

# path
CORE_PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin
CARGO_PATH=$HOME/.cargo/bin
GOBIN=$GOPATH/bin
PROJ_PATH=$HOME/bin/scripts:$HOME/bin/projects

export PATH=$PATH:$CORE_PATH:$CARGO_PATH:$GOBIN:$PROJ_PATH

# pnpm
export PNPM_HOME="/home/jdot/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# starting hyprland on TTY1
[[ $- != *i* ]] && return # exit if not interactive
if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec Hyprland
fi
