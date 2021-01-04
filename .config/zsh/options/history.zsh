# ~/.zsh/options/history.zsh

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.cache/zsh/zhistory
export HISTORY_IGNORE="(ls|cd|pwd|exit|:q|ea|fe|clear|n|update)"

# Add commands to the history immediately
setopt inc_append_history
setopt APPEND_HISTORY
# Do not record an event starting with a space
setopt HIST_IGNORE_SPACE
# Do not record an event that was just recorded again
setopt HIST_IGNORE_DUPS
# Delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_ALL_DUPS
# Do not display a previously found event
setopt HIST_FIND_NO_DUPS
# Share history between all sessions
setopt share_history
