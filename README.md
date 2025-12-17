## 📱 Termux + LazyVim Setup

This project includes a **mobile-friendly Neovim configuration** designed to run smoothly inside **Termux**.

### Prerequisites
- Termux installed
- Internet connection

### Installation

Run the following commands inside Termux:

```sh
pkg update && pkg upgrade -y

pkg install -y \
  neovim \
  git \
  clang \
  wget \
  unzip \
  curl \
  ripgrep \
  luarocks \
  clangd \
  fd

# Install Nerd Font (FiraCode)
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip -d firacode

# Set Termux font
mkdir -p ~/.config/termux
cp firacode/FiraCodeNerdFont-Regular.ttf ~/.termux/font.ttf
cp firacode/FiraCodeNerdFont-Regular.ttf ~/.config/termux/font.ttf

# Neovim configuration
git clone https://github.com/lcmonteiro/starter_mobile ~/.config/nvim
