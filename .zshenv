# ~/.zshenv

# Defines environment variables.
# Xdg
test "$XDG_CACHE_HOME"  || XDG_CACHE_HOME="$HOME/.cache"
test "$XDG_CONFIG_HOME" || XDG_CONFIG_HOME="$HOME/.config"
test "$XDG_DATA_HOME"   || XDG_DATA_HOME="$HOME/.local/share"

ZDOTDIR=$HOME/.config/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
