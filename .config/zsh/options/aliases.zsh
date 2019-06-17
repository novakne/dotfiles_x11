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
alias scripts='cd $HOME/bin/'
alias conf='cd .config'
alias doc='cd docs'
alias dl='cd download'
alias vid='video'
alias img='cd img'
alias dot='cd dotfiles'
alias web='cd src/web/'
alias formation="cd src/web/_formation"
alias boilerplate="cd src/web/_boilerplate"
alias not='cd docs/notes'

# Files
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nvim PKGBUILD'
alias fixit='sudo rm -f /var/lib/pacman/db.lck'
alias cmx='chmod a+x'
alias del='trash-put'

# Config
alias ev='nvim $XDG_CONFIG_HOME/nvim/init.vim'
alias ez='nvim $XDG_CONFIG_HOME/zsh/.zshrc'
alias ebs='nvim $XDG_CONFIG_HOME/bspwm/bspwmrc'
alias esx='nvim $XDG_CONFIG_HOME/sxhkd/sxhkdrc'

### TOOLS
# Exa ( https://github.com/ogham/exa )
alias exa='exa --group-directories-first'
alias ea='exa -lah --group-directories-first --git'
alias et='exa -lah -TL2 --group-directories-first --git'

# Nnn ( https://github.com/jarun/nnn )
alias nl='nnn -l'
alias nh='nnn -ld'
alias nt='nnn -ldi'
alias ns='nnn -S'

# Sxiv ( https://github.com/muennich/sxiv )
alias sx='sxiv -b'
alias sxf='sxiv -bf'
alias sxt='sxiv -bt'

### GIT
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias goc='git checkout '

# YADM
alias yads='yadm status'
alias yada='yadm add'
alias yadp='yadm push'
alias yadc='yadm commit -m'

### WEB DEV
# Npm
alias upnpm='npm install npm@latest -g'
alias npi='npm install'
alias npid='npm install --save-dev'
alias npig='npm install --global'
alias npt='npm test'
alias npit='npm install && npm test'
alias npr='npm run'
alias nps='npm start'
alias nplg='npm list --global --depth=0'

# Yarn
alias ya='yarn'
alias yiy='yarn init -y'
alias yaa='yarn add'
alias yad='yarn dev'
alias yas='yarn start'
alias yat='yarn test'

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
