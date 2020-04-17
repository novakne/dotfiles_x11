PROMPT_GIT_BRANCH_COLOR=white
PROMPT_GIT_ADDED="%F{green}+%f"
PROMPT_GIT_MODIFIED="%F{yellow}!%f"
PROMPT_GIT_DELETED="%F{red}✗%f"
PROMPT_GIT_STASHED="%F{yellow}$%f"
PROMPT_GIT_RENAMED="%F{magenta}»%f"
PROMPT_GIT_UNMERGED="%F{yellow}═%f"
PROMPT_GIT_UNTRACKED="%F{blue}?%f"
PROMPT_GIT_AHEAD="%F{white}⇡ %f"
PROMPT_GIT_BEHIND="%F{white}⇣ %f"
PROMPT_GIT_PREFIX="%F{white}[%f"
PROMPT_GIT_SUFFIX="%F{white}]%f"

# vcs_info hook
prompt_exec_vcs_info_precmd_hook() {
    vcs_info
}

# Check if the current directory is in a Git repository.
_prompt_is_git() {
    [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

# Display git branch
prompt_git_branch() {
    local git_current_branch="$vcs_info_msg_0_"
    [[ -z "$git_current_branch" ]] && return

    git_current_branch="${git_current_branch#heads/}"
    git_current_branch="${git_current_branch/.../}"

    echo "%F{$PROMPT_GIT_BRANCH_COLOR}_${git_current_branch}%f"
}

# Display git status
prompt_git_status() {

    _prompt_is_git || return

    local INDEX git_status=""

    INDEX=$(command git status --porcelain -b 2> /dev/null)

    # Check for untracked files
    if echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null; then
        git_status="$PROMPT_GIT_UNTRACKED$git_status"
    fi

    # Check for staged files
    if echo "$INDEX" | command grep '^A[ MDAU] ' &> /dev/null; then
        git_status="$PROMPT_GIT_ADDED$git_status"
    elif echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null; then
        git_status="$PROMPT_GIT_ADDED$git_status"
    elif echo "$INDEX" | command grep '^UA' &> /dev/null; then
        git_status="$PROMPT_GIT_ADDED$git_status"
    fi

    # Check for modified files
    if echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null; then
        git_status="$PROMPT_GIT_MODIFIED$git_status"
    fi

    # Check for renamed files
    if echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null; then
        git_status="$PROMPT_GIT_RENAMED$git_status"
    fi

    # Check for deleted files
    if echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null; then
        git_status="$PROMPT_GIT_DELETED$git_status"
    elif echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null; then
        git_status="$PROMPT_GIT_DELETED$git_status"
    fi

    # Check for stashes
    if command git rev-parse --verify refs/stash >/dev/null 2>&1; then
        git_status="$PROMPT_GIT_STASHED$git_status"
    fi

    # Check for unmerged files
    if echo "$INDEX" | command grep '^U[UDA] ' &> /dev/null; then
        git_status="$PROMPT_GIT_UNMERGED$git_status"
    elif echo "$INDEX" | command grep '^AA ' &> /dev/null; then
        git_status="$PROMPT_GIT_UNMERGED$git_status"
    elif echo "$INDEX" | command grep '^DD ' &> /dev/null; then
        git_status="$PROMPT_GIT_UNMERGED$git_status"
    elif echo "$INDEX" | command grep '^[DA]U ' &> /dev/null; then
        git_status="$PROMPT_GIT_UNMERGED$git_status"
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

    [[ "$is_ahead" == true ]] && git_status="$PROMPT_GIT_AHEAD$git_status"
    [[ "$is_behind" == true ]] && git_status="$PROMPT_GIT_BEHIND$git_status"

    if [[ -n $git_status ]]; then
	echo "$PROMPT_GIT_PREFIX$git_status$PROMPT_GIT_SUFFIX"
    fi
}

