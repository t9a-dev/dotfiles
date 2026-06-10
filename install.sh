#!/usr/bin/env sh
set -eu

DOTFILES="."

brew bundle --file="$DOTFILES/Brewfile.common"

case "$(uname -s)" in
Darwin)
  brew bundle --file="$DOTFILES/Brewfile.darwin"
  ;;
Linux)
  brew bundle --file="$DOTFILES/Brewfile.linux"
  ;;
esac
