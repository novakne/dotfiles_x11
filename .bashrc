# $HOME/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ___OPTIONS___
# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null
# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# Append to the history file, don't overwrite it
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# ___ENV___
export $HISTFILE=~/.cache/bash/bash_history
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
export RUSTUP_HOME=$HOME/.local/share/rustup
export CARGO_HOME=$HOME/.local/share/cargo
export PATH=$HOME/.local/share/cargo/bin:$PATH

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


# ___ALIAS___
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

# ___PROMPT___
function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[33m\]\w\[\e[m\] \`parse_git_branch\` \[\e[31m\]\`nonzero_return\`\[\e[m\] "

