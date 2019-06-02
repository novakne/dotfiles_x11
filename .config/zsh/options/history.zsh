# ~/.zsh/options/history.zsh

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/zhistory
HISTORY_IGNORE="(ls|cd|pwd|exit|:q|ea|fe|clear)"
setopt inc_append_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt share_history
