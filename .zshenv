# ~/.zshenv

# Defines environment variables.
# XDG
[[ -z "$XDG_CACHE_HOME" ]]  && export XDG_CACHE_HOME="$HOME"/.cache
[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME="$HOME"/.config
[[ -z "$XDG_DATA_HOME" ]]   && export XDG_DATA_HOME="$HOME"/.local/share

# Change zsh configuration path
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
