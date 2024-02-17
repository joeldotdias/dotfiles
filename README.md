# dotfiles

A somewhat minimal config based mostly off ThePrimeagen and Omerxx, with a decent proportion of my own changes.
<br>
It won't make your terminal look too good but your grandma will think you're cool

In case anyone decides on using this config, you'll need the following installed:
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [tpm](https://github.com/tmux-plugins/tpm) (Tmux Plugin Manager)
- A [patched nerd font](https://www.nerdfonts.com/font-downloads) (I use HackNerdFont)
- [zoxide](https://github.com/ajeetdsouza/zoxide)


<br>Symlinks in case you put this in a `~/.dotfiles` dir
```
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
```