# ~/.zsh/options/aliases.zsh

### PACKAGES
# Pacman
alias upgrade='sudo pacman -Syuu'
alias mirrors='sudo pacman-mirrors -g'
alias pac='sudo pacman'
alias spkg='pacman -Qe | grep'

# Yay ( https://github.com/Jguer/yay )
alias yy='yay'
alias inst='yay -S'
alias update='yay -Syuu'
alias orph='yay -Qdt'
alias pdel='yay -Rsn'
alias delorph='yay -Rs $(yay -Qtdq)'

### FILES MANAGEMENT
# Directories
alias scripts='cd $HOME/bin'
alias conf='cd $HOME/.config'
alias doc='cd $HOME/doc'
alias dl='cd $HOME/dl'
alias vid='cd $HOME/video'
alias not='cd $HOME/doc/notes'

# Files
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=always -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nvim PKGBUILD'
alias fixit='sudo rm -f /var/lib/pacman/db.lck'
alias cmx='chmod 774'
alias del='trash-put'

### TOOLS
# Exa ( https://github.com/ogham/exa )
alias exa='exa --group-directories-first --icons'
alias ea='exa -lah --group-directories-first --git --icons'
alias et='exa -lah -TL2 --group-directories-first --git --icons'

# Nnn ( https://github.com/jarun/nnn )
alias nn='nnn -en'
alias N='sudo -E nnn -dHn'

# Sxiv ( https://github.com/muennich/sxiv )
alias sx='sxiv -b'
alias sxf='sxiv -bf'
alias sxt='sxiv -bt'

# Z.lua ( https://github.com/skywind3000/z.lua )
alias zf='z -I'  # Z with fzf
alias zb='z -b'  # Z back
alias zbf='z -b -I'  # Z back with fzf
alias zh='z -I -t .' # Z history with fzf

# YADM
alias yads='yadm status'
alias yada='yadm add'
alias yadp='yadm push'
alias yadc='yadm commit -m'

### DEV
# GIT
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias goc='git checkout '

# Rust
alias cn='cargo new'
alias cr='cargo run'
alias ct='cargo test'
alias cw='cargo watch'

### MISC
alias Xress='xrdb $HOME/.config/X11/xresources'
alias :q='exit'
alias startadb='sudo ./adb start-server'
alias stopadb='./adb kill-server'
alias msc='ncmpcpp'
alias wname='xprop | grep WM_CLASS'
alias fp='fzf --preview "bat --theme TwoDark --color always {}" --preview-window=right:70%:wrap'
alias wget='wget --hsts-file="$HOME/.cache/wget-hsts"'
alias fzfup='cd ~/.config/fzf && git pull && ./install --bin --no-update-rc --64'
alias awesometest='Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome'
