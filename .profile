# $HOME/.profile

### ENVIRONMENT

# Bin
path=(
  /usr/local/{bin,sbin}
  $path
)

# User local scripts
export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/bar:$PATH
export PATH=$HOME/bin/colors:$PATH

export XINITRC=$HOME/.config/X11/xinitrc

