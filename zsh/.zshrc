# ------------------------------------------------------------
# OS detection
# ------------------------------------------------------------

case "$(uname -s)" in
  Darwin)
    OS_TYPE="macos"
    ;;
  Linux)
    OS_TYPE="linux"
    ;;
  *)
    OS_TYPE="unknown"
    ;;
esac

# WSL detection
if grep -qi microsoft /proc/version 2>/dev/null; then
  IS_WSL=true
else
  IS_WSL=false
fi

# ------------------------------------------------------------
# Homebrew
# ------------------------------------------------------------

if [[ "$OS_TYPE" == "macos" ]]; then
  # Apple Silicon Homebrew
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  # Intel Mac Homebrew
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
elif [[ "$OS_TYPE" == "linux" ]]; then
  # Linuxbrew / Homebrew on Linux
  if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi

# ------------------------------------------------------------
# PATH
# ------------------------------------------------------------

# Rust / Cargo
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# ------------------------------------------------------------
# zsh completion
# ------------------------------------------------------------

if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix)"

  if [[ -d "$BREW_PREFIX/share/zsh-completions" ]]; then
    FPATH="$BREW_PREFIX/share/zsh-completions:$FPATH"
  fi

  if [[ -d "$BREW_PREFIX/share/zsh/site-functions" ]]; then
    FPATH="$BREW_PREFIX/share/zsh/site-functions:$FPATH"
  fi
fi

autoload -Uz compinit
compinit

# ------------------------------------------------------------
# mise
# ------------------------------------------------------------

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
  eval "$(mise completion zsh)"
fi

# ------------------------------------------------------------
# GPG
# ------------------------------------------------------------

export GPG_TTY=$(tty)

# ------------------------------------------------------------
# Starship
# ------------------------------------------------------------

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
