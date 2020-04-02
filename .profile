# $HOME/.profile

### ENVIRONMENT

export LC_COLLATE=C

export BROWSER="vivaldi-stable"
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Use neovim instead of vim for pacdiff
export DIFFPROG='nvim -d'

# Give a name to nvim server to start with neovim-remote
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim

# Less
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -z-4'
export LESSHISTFILE=$HOME/.cache/less

# XDG
[[ -z "$XDG_CACHE_HOME" ]]  && export XDG_CACHE_HOME="$HOME"/.cache
[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME="$HOME"/.config
[[ -z "$XDG_DATA_HOME" ]]   && export XDG_DATA_HOME="$HOME"/.local/share

# Bin
path=(
  /usr/local/{bin,sbin}
  $path
)

# User local scripts
export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/colors:$PATH

export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export PARALLEL_HOME=$XDG_CACHE_HOME/parallel
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Npm
export PATH=$XDG_DATA_HOME/npm/bin:$PATH
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Yarn
export PATH=$XDG_CONFIG_HOME/yarn/global/node_modules/bin:$PATH

# Rust
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
export PATH=$XDG_DATA_HOME/cargo/bin:$PATH

# BSPWM
export PANEL_FIFO="/tmp/panel-fifo"
path=(
  $XDG_CONFIG_HOME/bspwm/{scripts,panel}
  $path
)

# NNN
export NNN_COLORS='2314'
export NNN_TRASH=1
export NNN_USE_EDITOR=1
export NNN_RESTRICT_NAV_OPEN=0
export NNN_RESTRICT_0B=1
export NNN_COPIER="$XDG_CONFIG_HOME/nnn/copier"
export NNN_BMS='c:~/.config;n:~/.config/nvim;z:~/.config/zsh;a:~/.config/awesome;i:~/img;s:~/src;d:~/docs/notes;l:~/.local/share'
export NNN_PLUG='f:browse_img_full;i:browse_img;s:fuzzy;c:_chmod a+x $nnn*'

# RIPGREP
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/rc"

# EXA
export EXA_COLORS="lp=34:da=37:uu=33:sn=35:sb=35"

