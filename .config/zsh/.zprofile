# $XDG_CONFIG_HOME/zsh/.zprofile
# Executes commands at login pre-zshrc.

# Language
if [[ -z "$LANG" ]]; then
  export LANG='fr_FR.UTF-8'
  export LANGUAGE=fr_FR.UTF-8
fi

export LC_ALL=fr_FR.UTF-8

# Autostart X at login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
