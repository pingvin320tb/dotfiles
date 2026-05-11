#!/bin/bash

if ! pacman -Q yay &>/dev/null; then
  sudo pacman -S --needed base-devel --noconfirm
  mkdir -p /tmp/repo
  git clone https://aur.archlinux.org/yay.git /tmp/repo
  cd /tmp/repo/yay
  makepkg -si --noconfirm
  cd $HOME
fi

yay -S niri kitty zsh starship btop cava drift fastfetch fuzzel mako nvim nwg-bar waybar wlogout stow fzf zoxide eza bat curl ripgrep fd lazygit unzip --noconfirm

mv $HOME/.zshrc{,.bak} &>/dev/null

# install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/zsh-syntax-highlighting"
git clone https://github.com/Aloxaf/fzf-tab "$ZSH_CUSTOM/fzf-tab"

rm -f "$HOME/.zshrc"
mv $HOME/.config/niri{,.bak} &>/dev/null
mv $HOME/.config/alacritty{,.bak} &>/dev/null
mv $HOME/.config/btop{,.bak} &>/dev/null
mv $HOME/.config/cava{,.bak} &>/dev/null
mv $HOME/.config/drift{,.bak} &>/dev/null
mv $HOME/.config/fastfetch{,.bak} &>/dev/null
mv $HOME/.config/fuzzel{,.bak} &>/dev/null
mv $HOME/.config/kitty{,.bak} &>/dev/null
mv $HOME/.config/mako{,.bak} &>/dev/null
mv $HOME/.config/micro{,.bak} &>/dev/null
mv $HOME/.config/nvim{,.bak} &>/dev/null
mv $HOME/.config/nwg-bar{,.bak} &>/dev/null
mv $HOME/.config/waybar{,.bak} &>/dev/null
mv $HOME/.config/wlogout{,.bak} &>/dev/null
mv $HOME/.config/settings.json{,.bak} &>/dev/null
mv $HOME/.config/starship.toml{,.bak} &>/dev/null
cd $HOME/dotfiles
stow .
