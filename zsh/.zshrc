export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# zsh completion
if command -v brew >/dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi

autoload -Uz compinit
compinit

# mise
eval "$(mise activate zsh)"
eval "$(mise completion zsh)"

# GPG
export GPG_TTY=$(tty)

# Starship
eval "$(starship init zsh)"
