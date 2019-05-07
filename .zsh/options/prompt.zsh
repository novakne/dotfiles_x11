# PROMPT
# by Novacane337

autoload -Uz promptinit
promptinit

# VARIABLES
# Allow for variable/function substitution in prompt
setopt PROMPT_SUBST

PROMPT_SYMBOL=
# PROMPT_SYMBOL=
PROMPT_EXEC_MAX=5
PROMPT_COLOR=yellow
PATH_COLOR=blue
BRANCH_COLOR=green
EXEC_COLOR=magenta
PROMPT_ADDED="%F{green}✓%f"
PROMPT_MODIFIED="%F{blue}✶%f"
PROMPT_DELETED="%F{red}✗%f"
PROMPT_STASHED="%F{blue}$%f"
PROMPT_RENAMED="%F{magenta}➜%f"
PROMPT_UNMERGED="%F{yellow}═%f"
PROMPT_UNTRACKED="%F{cyan}✩%f"
PROMPT_DIVERGED="%F{blue}⇕%f"
PROMPT_AHEAD="%F{green}⇡%f"
PROMPT_BEHIND="%F{red}⇣%f"

### LIB

# source $HOME/.zsh/options/async.zsh

# Human readable time
prompt_displaytime() { 
    local T=$1
    local D=$((T/60/60/24))
    local H=$((T/60/60%24))
    local M=$((T/60%60))
    local S=$((T%60))
    [[ $D -gt 0 ]] && printf '%dd ' $D
    [[ $H -gt 0 ]] && printf '%dh ' $H
    [[ $M -gt 0 ]] && printf '%dm ' $M
    printf '%ds' $S
}

# Check if the current directory is in a Git repository.
prompt_is_git() {
    [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

# Colors
prompt_colorize() {
    echo "%F{$1}$2%f"
}

### SYMBOL
# Change color if the last command didn't works
prompt_symbol() {
    echo "%(?.%F{$PROMPT_COLOR}.%F{red})$PROMPT_SYMBOL%f "
}

### PATH
# don't show path in ~ and just one if in a git dir
prompt_path() {
    if [[ $PWD = ~ ]]; then
        echo "%F{$PATH_COLOR}% %f"
    elif prompt_is_git; then
        echo "%F{$PATH_COLOR}%1/%f "
    else
        echo "%F{$PATH_COLOR}%~%f "
    fi
}

### CMD EXEC TIME
# Execution time start
prompt_exec_preexec_hook() {
    PROMPT_EXEC_TIME_start=$(date +%s)
}

# Execution time end
prompt_exec_precmd_hook() {
    [[ -n $PROMPT_EXEC_TIME_duration ]] && unset PROMPT_EXEC_TIME_duration
    [[ -z $PROMPT_EXEC_TIME_start ]] && return
    local PROMPT_EXEC_TIME_stop
    PROMPT_EXEC_TIME_stop=$(date +%s)
    PROMPT_EXEC_TIME_duration=$(( PROMPT_EXEC_TIME_stop - PROMPT_EXEC_TIME_start ))
    unset PROMPT_EXEC_TIME_start
}

# Display exec time
prompt_exec() {
    if [[ $PROMPT_EXEC_TIME_duration -ge $PROMPT_EXEC_MAX ]]; then
        echo "%F{$EXEC_COLOR}$(prompt_displaytime $PROMPT_EXEC_TIME_duration)%f "
    fi 
}

### GIT
# vcs_info hook
prompt_exec_vcs_info_precmd_hook() {
    vcs_info
}

# Display git branch
prompt_git_branch() {
    local git_current_branch="$vcs_info_msg_0_"
    [[ -z "$git_current_branch" ]] && return

    git_current_branch="${git_current_branch#heads/}"
    git_current_branch="${git_current_branch/.../}"

    echo "%F{$BRANCH_COLOR} ${git_current_branch}%f "
}

# Display git status
prompt_git_status() {

    prompt_is_git || return

    local INDEX git_status=""

    INDEX=$(command git status --porcelain -b 2> /dev/null)

    # Check for untracked files
    if echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null; then
        git_status="$PROMPT_UNTRACKED $git_status "
    fi

    # Check for staged files
    if echo "$INDEX" | command grep '^A[ MDAU] ' &> /dev/null; then
        git_status="$PROMPT_ADDED $git_status "
    elif echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null; then
        git_status="$PROMPT_ADDED $git_status "
    elif echo "$INDEX" | command grep '^UA' &> /dev/null; then
        git_status="$PROMPT_ADDED $git_status "
    fi

    # Check for modified files
    if echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null; then
        git_status="$PROMPT_MODIFIED $git_status "
    fi

    # Check for renamed files
    if echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null; then
        git_status="$PROMPT_RENAMED $git_status "
    fi

    # Check for deleted files
    if echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null; then
        git_status="$PROMPT_DELETED $git_status "
    elif echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null; then
        git_status="$PROMPT_DELETED $git_status "
    fi

    # Check for stashes
    if command git rev-parse --verify refs/stash >/dev/null 2>&1; then
        git_status="$PROMPT_STASHED $git_status "
    fi

    # Check for unmerged files
    if echo "$INDEX" | command grep '^U[UDA] ' &> /dev/null; then
        git_status="$PROMPT_UNMERGED $git_status "
    elif echo "$INDEX" | command grep '^AA ' &> /dev/null; then
        git_status="$PROMPT_UNMERGED $git_status "
    elif echo "$INDEX" | command grep '^DD ' &> /dev/null; then
        git_status="$PROMPT_UNMERGED $git_status "
    elif echo "$INDEX" | command grep '^[DA]U ' &> /dev/null; then
        git_status="$PROMPT_UNMERGED $git_status "
    fi

    # Check whether branch is ahead
    local is_ahead=false
    if echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null; then
        is_ahead=true
    fi

    # Check whether branch is behind
    local is_behind=false
    if echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null; then
        is_behind=true
    fi

    # Check wheather branch has diverged
    if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
        git_status="$PROMPT_DIVERGED $git_status "
    else
        [[ "$is_ahead" == true ]] && git_status="$PROMPT_AHEAD $git_status "
        [[ "$is_behind" == true ]] && git_status="$PROMPT_BEHIND $git_status "
    fi

    if [[ -n $git_status ]]; then
        echo "$git_status"
    fi
}

### ASYNC
# Callback
prompt_async_callback() {
PROMPT='
$(prompt_path)$(prompt_exec)$(prompt_symbol)'
RPROMPT='$(prompt_git_branch)$(prompt_git_status)'
    zle && zle reset-prompt

    # Stop async worker
    async_stop_worker prompt_async_worker
}

# prompt_async() {
#     cd -q $1 > /dev/null
# }

# Flushed currently running async jobs and queues a new one
prompt_async_job() {
    async_start_worker prompt_async_worker -u -n
    async_register_callback prompt_async_worker prompt_async_callback

    async_flush_jobs prompt_async_worker 
    async_job prompt_async_worker prompt_async $PWD
}

# Initialize zsh-async and creates a worker
prompt_async_setup() {
    async_init

    # Submit a new job every precmd
    add-zsh-hook precmd prompt_async_job
    autoload -Uz vcs_info
    autoload -Uz add-zsh-hook
    prompt_opts=(cr percent sp subst)
    prompt_git_branch noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"
    add-zsh-hook preexec prompt_exec_preexec_hook
    add-zsh-hook precmd prompt_exec_precmd_hook
    add-zsh-hook precmd prompt_exec_vcs_info_precmd_hook
    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:git*' formats '%b'
}



prompt_setup() {
    # Prevent percentage showing up if output doesn't end with a newline.
    export PROMPT_EOL_MARK=''
    prompt_async_setup
}

prompt_setup "$@"
