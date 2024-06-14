#!/usr/bin/env bash

function get_response() {
	local ask=$1
	local response=""
	read -r -p "$ask? (y/n) " response </dev/tty

	if [[ $response != "y" ]]; then
		return 1
	fi
}

function get_version() {
	local repo=$1
	local prefix=$2

	local version
	version=$(curl -s "https://api.github.com/repos/${repo}/releases/latest" | grep -Po "\"tag_name\": \"${prefix:-""}\K[^\"]*")
	echo "$version"
}

function getting() {
	echo "=============$1============="
}

function set_font() {
	local fonts_dir="$HOME/.local/share/fonts"
	if [ ! -d "${fonts_dir}" ]; then
		mkdir -p "${fonts_dir}"
	else
		echo "Found fonts dir $fonts_dir"
	fi

	sudo apt -y install fontconfig

	local fira_version
	fira_version=$(get_version "tonsky/FiraCode")
	local fira_zip=Fira_Code_v${fira_version}.zip
	curl --fail --location --show-error "https://github.com/tonsky/FiraCode/releases/download/${fira_version}/${fira_zip}" --output "${fira_zip}"
	unzip -o -q -d "${fonts_dir}" "${fira_zip}"
	rm "${fira_zip}"

	fc-cache -f
}

function get_utils() {
	getting "starship"
	curl -sS https://starship.rs/install.sh | sh

	getting "fzf"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

	getting "ripgrep"
	local ripgrep_version
	ripgrep_version=$(get_version "BurntSushi/ripgrep")
	curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/${ripgrep_version}/ripgrep_${ripgrep_version}_amd64.deb"
	sudo dpkg -i "ripgrep_${ripgrep_version}_amd64.deb"

	getting "zoxide"
	curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

	getting "tmux"
	sudo apt-get -y install tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	getting "jq"
	sudo apt-get -y install jq

	getting "lazygit"
	local lazygit_version
	lazygit_version=$(get_version "jesseduffield/lazygit" "v")
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${lazygit_version}_Linux_x86_64.tar.gz"
	sudo tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin

	getting "lazydocker"
	curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

	getting "toipe"
	cargo install toipe
}

function get_langs() {
	getting "rust"
	curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
	. "$HOME/.cargo/env"

	getting "go"
	wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz -O go.tar.gz
	sudo rm -rf /usr/local/go && sudo tar -xzvf go.tar.gz -C /usr/local
	go install honnef.co/go/tools/cmd/staticcheck@latest
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin v1.57.2
	sudo apt -y install goreleaser
	go install github.com/spf13/cobra-cli@latest

	getting "zig"
	local zig_version
	zig_version=$(get_version "ziglang/zig")
	wget "https://ziglang.org/download/${zig_version}/zig-linux-x86_64-${zig_version}.tar.xz"
	sudo tar xf "zig-linux-x86_64-${zig_version}.tar.xz"

	getting "ocaml"
	sudo apt-get -y install bubblewrap
	sudo bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
	opam init -y
	eval "$(opam env)"
	opam install ocaml-lsp-server odoc ocamlformat utop

	getting "lua"
	local lua_version
	lua_version=$(get_version "lua/lua" "v")
	curl -L -R -O "https://www.lua.org/ftp/lua-${lua_version}.tar.gz"
	sudo tar zxf "lua-${lua_version}.tar.gz"
	(
		cd "lua-${lua_version}"
		sudo make all test && sudo make install
	)
	wget https://luarocks.org/releases/luarocks-3.11.0.tar.gz
	sudo tar zxpf luarocks-3.11.0.tar.gz
	(
		cd luarocks-3.11.0
		./configure && make && sudo make install
	)
	cargo install stylua && cargo install selene

	getting "gleam"
	local gleam_version
	gleam_version=$(get_version "gleam-lang/gleam" "v")
	curl -LO "https://github.com/gleam-lang/gleam/releases/latest/download/gleam-v${gleam_version}-x86_64-unknown-linux-musl.tar.gz"
	sudo install tar xf "gleam-v${gleam_version}-x86_64-unknown-linux-musl.tar.gz" gleam

	getting "node"
	local nvm_version
	nvm_version=$(get_version "nvm-sh/nvm" "v")
	curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${nvm_version}/install.sh" | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
	nvm install 20

	getting "erlang"
	wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb
	sudo dpkg -i erlang-solutions_2.0_all.deb
	sudo apt-get update
	sudo apt-get install esl-erlang
}

function setup_git() {
	git config --global user.name "joeldotdias"
	local email=""
	read -r -p "Git email: " email </dev/ttyread
	git config --global user.email "$email"

	git config --global init.defaultBranch "master"

	git config --global core.autocrlf "false"
	git config --global core.safecrlf "false"

	git config --global merge.tool "nvim -d"

	git config --global color.ui "true"
	echo -e "[ui \"color\"]\n\tui = true\n" >>~/.gitconfig

	git config --global alias.lgr "log --graph"
	git config --global alias.lgo "log --graph --oneline"
}

function setup_vim() {
	sudo apt-get -y install ninja-build gettext cmake unzip
	local nvim_dir="$HOME/tools/neovim"
	mkdir -p "$nvim_dir"
	git clone https://github.com/neovim/neovim "$nvim_dir"
	(
		cd "$nvim_dir" || return
		git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
	)
	git config --global core.editor "nvim"

	# vim instead of preinstalled vim.tiny
	sudo apt-get -y remove vim.tiny
	sudo apt-get -y install vim
}

function make_symlinks() {
	ln -s ~/.dotfiles/nvim ~/.config/nvim
	ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
	ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
	ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
	ln -s ~/.dotfiles/scripts ~/bin/scripts
}

function zsh_setup() {
	sudo apt -y install zsh
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	chsh -s "$(which zsh)"
}

function cleanup() {
	rm ripgrep*
	rm lazygit.tar.gz && rm -rf lazygit
	rm zig-linux-x86_64-0.12.0.tar.xz
	rm go.tar.gz
}

mkdir ~/.config
mkdir ~/bin

set -e

sudo apt-get -y install git
sudo apt -y update && sudo apt -y upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install wget
sudo apt-get -y install unzip

dotfiles_dir="$HOME/.dotfiles"
echo "==========Getting dotfiles=========="
mkdir -p "$dotfiles_dir"
git clone --depth 1 https://github.com/joeldotdias/dotfiles.git "$dotfiles_dir"

get_response "Install languages" && get_langs

get_response "Install utils" && get_utils

get_response "Setup git" && setup_git

get_response "Setup neovim" && setup_vim

get_response "Make symlinks" && make_symlinks

get_response "Setup zsh" && zsh_setup

get_response "Set font" && set_font

get_response "Cleanup" && cleanup

echo -e "\nRestart the shell to finish"
