# $XDG_CONFIG_HOME/zsh/.zshrc

### ZPLUGIN
declare -A ZPLGM
ZPLGM[HOME_DIR]="$ZDOTDIR"/zplugin
ZPLGM[COMPINIT_OPTS]=-C
source "$ZDOTDIR"/zplugin/bin/zplugin.zsh

# Plugins list
zplugin light mafredri/zsh-async

zplugin ice wait"0" lucid blockf
zplugin light zsh-users/zsh-completions

zplugin ice wait"0" lucid atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Need to be load last
zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

### LAZY LOAD FUNCTIONS
fpath=("$ZDOTDIR/functions" $fpath)
typeset -U zsh_functions="$ZDOTDIR"/functions

if [[ -d "$zsh_functions" ]]; then
    for func in $zsh_functions/*; do
        autoload -Uz ${func:t}
    done
fi
unset zsh_functions

### LOAD ZSH OPTIONS
typeset -U zsh_options="$ZDOTDIR"/options

if [[ -d "$zsh_options" ]]; then
   for file in $zsh_options/*.zsh; do
      source $file
   done
fi
unset zsh_options
