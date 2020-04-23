# ~/.zsh/options/aliases.zsh

### PACKAGES
# Pacman
alias upgrade='sudo pacman -Syuu'
alias pac='sudo pacman'
alias spkg='pacman -Q | grep'

# Yay ( https://github.com/Jguer/yay )
alias yy='yay'
alias inst='yay -S'
alias update='yay -Syuu'
alias orph='yay -Qdt'
alias pdel='yay -Rsn'
alias delorph='yay -Rs $(yay -Qtdq)'
alias archnews='yay -Pww'

### FILES MANAGEMENT
# Directories
alias note='cd $HOME/doc/notes'

# Files
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=always -d skip'
alias cp='cp -i'
alias df='df -h'
alias free='free -m'
alias cmx='chmod 774'
alias del='trash-put'

### TOOLS
alias g='git'
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

### MISC
alias Xress='xrdb $HOME/.config/X11/xresources'
alias :q='exit'
alias startadb='sudo ./adb start-server'
alias stopadb='./adb kill-server'
alias msc='ncmpcpp'
alias wname='xprop | grep WM_CLASS'
alias wget='wget --hsts-file="$HOME/.cache/wget-hsts"'
alias fzfup='cd ~/.config/fzf && git pull && ./install --bin --no-update-rc --64'
alias awesometest='Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome'
