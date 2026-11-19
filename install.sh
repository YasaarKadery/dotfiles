#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_file() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"

  if [[ -L "$dst" ]]; then
    rm "$dst"
  elif [[ -e "$dst" ]]; then
    echo "Backing up existing $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  ln -s "$src" "$dst"
  echo "Linked $dst -> $src"
}

link_file "$DOTFILES_DIR/zsh/.zshrc"                    "$HOME/.zshrc"
link_file "$DOTFILES_DIR/git/.gitconfig"                "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/starship/.config/starship.toml" "$HOME/.config/starship.toml"
link_file "$DOTFILES_DIR/bat/.config/bat/config"        "$HOME/.config/bat/config"
link_file "$DOTFILES_DIR/ghostty/.config/ghostty/config" "$HOME/.config/ghostty/config"

echo ""
echo "Done! Run 'brew bundle --file=$DOTFILES_DIR/Brewfile' to install packages, then restart your shell."
