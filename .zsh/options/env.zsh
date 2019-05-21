# ~/.zsh/options/environment.zsh

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
export LESSHISTFILE='$HOME/.cache/less'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Bin
path=(
  /usr/local/{bin,sbin}
  $path
)

# Completion
fpath=($HOME/.zsh/completions $fpath)

# User local scripts
export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/bar:$PATH
export PATH=$HOME/bin/colors:$PATH

# Npm
export PATH=$HOME/.node_modules/bin:$PATH
export npm_config_prefix=~/.node_modules

# Yarn
export PATH=$HOME/.config/yarn/global/node_modules/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Android sdk
export PATH=$HOME/Android/Sdk/platform-tools:$PATH

# BSPWM
export PANEL_FIFO="/tmp/panel-fifo"
path=(
  $HOME/.config/bspwm/{scripts,panel}
  $path
)

# NNN
export LC_COLLATE=C
export NNN_SHOW_HIDDEN=1
export NNN_SCRIPT=$HOME/bin/nnn
export NNN_CONTEXT_COLORS='2314'
export NNN_TRASH=1
export NNN_USE_EDITOR=1
export NNN_RESTRICT_NAV_OPEN=1
export NNN_TMPFILE="/tmp/nnn"

# AUTOJUMP
[[ -s /home/novakane/.autojump/etc/profile.d/autojump.sh ]] && source /home/novakane/.autojump/etc/profile.d/autojump.sh

# RIPGREP
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep"

# EXA
export LS_COLORS="ex=31;1:di=36;1:ln=34;4"
export EXA_COLORS="lp=34:da=37:uu=33:sn=35:sb=35"

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

_gen_fzf_default_opts() {

    local aize00='#29223a'
    local aize01='#3e3350'
    local aize02='#534666'
    local aize03='#6b5c7c'
    local aize04='#837593'
    local aize05='#9d8fa9'
    local aize06='#b7acbf'
    local aize07='#d2ccd6'
    local aize08='#f63d81'
    local aize09='#fc65b0'
    local aize10='#f5939c'
    local aize11='#e8ec77'
    local aize12='#2dcbb0'
    local aize13='#57bbf4'
    local aize14='#a89bee'
    local aize15='#4db9c8'

    export FZF_DEFAULT_OPTS="
    --color=bg+:$aize00,bg:$aize00,spinner:$aize09,hl:$aize12
    --color=fg:$aize05,header:$aize09,info:$aize09,pointer:$aize11
    --color=marker:$aize13,fg+:$aize07,prompt:$aize09,hl+:$aize11
    --height 50% --reverse --margin 2% --cycle --multi
    "

}

_gen_fzf_default_opts

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Uses tree command to show the entries of the directory
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
