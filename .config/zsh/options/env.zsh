# $HOME/.config/zsh/options/env.zsh

export BROWSER='vivaldi-stable'
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Add a title to terminal window
xterm_title_precmd () {
	print -Pn -- '\e]2;%~\a'
}

xterm_title_preexec () {
	print -Pn -- '\e]2;%~ %# ' && print -n -- "${(q)1}\a"
}

if [[ "$TERM" == (alacritty*|kitty*|rxvt*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Use neovim instead of vim for pacdiff
export DIFFPROG='nvim -d'

# Give a name to nvim server to start with neovim-remote
(( $+commands[nvr] )) && export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim

# Less
# Set the default Less options.
if (( $+commands[less] )); then
    export LESS='-g -i -M -R -S -w -z-4'
    export LESSHISTFILE=$HOME/.cache/less
    # Colors
    export LESS_TERMCAP_md=$'\e[1;31m'
    export LESS_TERMCAP_me=$'\e[0m'
    export LESS_TERMCAP_se=$'\e[0m'
    export LESS_TERMCAP_so=$'\e[1;40;36m'
    export LESS_TERMCAP_ue=$'\e[0m'
    export LESS_TERMCAP_us=$'\e[1;33m'
fi

if [[ -r "$XDG_CONFIG_HOME"/dircolors ]]; then
    eval $(dircolors $XDG_CONFIG_HOME/dircolors)
fi

# Ensure path arrays do not contain duplicates.
typeset -gU path PATH cdpath CDPATH fpath FPATH manpath MANPATH mailpath

# System bin
path=(/usr/local/{bin,sbin} $path)
systemctl --user import-environment PATH

# User bin
[[ -d "$HOME"/.local/bin ]] && path=("$HOME"/.local/{bin,bin/colors} $path)

# Completions
fpath=("$ZDOTDIR"/completions $fpath)

# Clean $HOME dir
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export PARALLEL_HOME="$XDG_CACHE_HOME"/parallel
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Npm
if (( $+commands[npm] )); then
    export PATH="$XDG_DATA_HOME"/npm/bin:$PATH
    export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
fi

# Yarn
if (( $+commands[yarn] )); then
    export PATH="$XDG_CONFIG_HOME"/yarn/global/node_modules/bin:$PATH
fi

# Lua
(( $+commands[luarocks] )) && export PATH="$HOME"/.luarocks/bin:$PATH

# Rust
if [[ -d "$XDG_DATA_HOME"/rustup && -d "$XDG_DATA_HOME"/cargo ]]; then
    export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
    export CARGO_HOME="$XDG_DATA_HOME"/cargo
    export PATH="$XDG_DATA_HOME"/cargo/bin:$PATH
fi

# Bspwm
if [[ -d "$XDG_CONFIG_HOME"/bspwm ]]; then
    export PANEL_FIFO='/tmp/panel-fifo'
    path=("$XDG_CONFIG_HOME"/bspwm/{scripts,panel} $path)
fi

# Nnn
if (( $+commands[nnn] )); then
    export NNN_COLORS='2314'
    export NNN_TRASH=1
    export NNN_USE_EDITOR=1
    export NNN_RESTRICT_NAV_OPEN=0
    export NNN_RESTRICT_0B=1
    export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
    export NNN_COPIER="$XDG_CONFIG_HOME"/nnn/copier
    export NNN_BMS='c:~/.config;n:~/.config/nvim;z:~/.config/zsh;a:~/.config/awesome;i:~/img;s:~/dev;d:~/doc;l:~/.local/share'
    export NNN_PLUG='f:fuzzy;i:imgview;o:open;c:_chmod 774 $nnn*;e:exec'
fi

# Ripgrep
(( $+commands[rg] )) && export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep/rc

# Exa
(( $+commands[exa] )) && export EXA_COLORS="lp=34:da=37:uu=33:sn=35:sb=35"

# Z.Lua
if [[ -d "$ZDOTDIR"/z.lua ]]; then
    export _ZL_ADD_ONCE=1
    export _ZL_ECHO=1
    export _ZL_DATA="$XDG_CACHE_HOME"/zlua/zlua
    eval "$(lua $ZDOTDIR/z.lua/z.lua --init zsh)"
fi

# Fzf
typeset -U fzf_dir="$XDG_CONFIG_HOME"/fzf
if [[ -d "$fzf_dir" ]]; then
    export PATH="$fzf_dir"/bin:$PATH
    source "$fzf_dir"/shell/completion.zsh 2> /dev/null
    source "$fzf_dir"/shell/key-bindings.zsh

    # export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden -E .git --color=always'
    # Uses tree command to show the entries of the directory
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

    _gen_fzf_default_opts() {
        # blue
        # local aize00='#29223a'
        # local aize01='#3e3350'
        # local aize02='#534666'
        # black
        local aize00='#232227'
        local aize01='#38383c'
        local aize02='#4e4e52'

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
        --height 50% --reverse --margin 2% --cycle --multi --ansi
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
fi
unset fzf_dir

