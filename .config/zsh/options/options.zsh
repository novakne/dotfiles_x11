# ~/.zsh/options/options.zsh

# Go to folder path without using cd
setopt AUTO_CD
# Push the current directory visited on the stack
setopt AUTO_PUSHD
# Do not store duplicates in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after pushd or popd
setopt PUSHD_SILENT

# Enable extended globbing
setopt extendedglob

# No Beep
setopt no_beep
setopt no_list_beep
setopt no_hist_beep

# Enable built-in command auto-correction
setopt correct

