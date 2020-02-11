# $XDG_CONFIG_HOME/zsh/.zshrc

### ZINIT
declare -A ZINIT
ZINIT[HOME_DIR]="$ZDOTDIR"/zinit
ZINIT[COMPINIT_OPTS]=-C
source "$ZDOTDIR"/zinit/bin/zinit.zsh

# Plugins list
zinit light mafredri/zsh-async

zinit ice wait blockf atpull'zinit creinstall -q .' lucid
zinit light zsh-users/zsh-completions

zinit ice wait atload"_zsh_autosuggest_start" lucid
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=true

zinit ice wait atinit"zpcompinit; zpcdreplay" lucid
zinit light zdharma/fast-syntax-highlighting

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
