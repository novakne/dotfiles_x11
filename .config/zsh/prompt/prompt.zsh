# PROMPT

autoload -Uz promptinit
promptinit

# VARIABLES
# Allow for variable/function substitution in prompt
setopt PROMPT_SUBST

PROMPT_SYMBOL="▁"
# PROMPT_SYMBOL="∎"
# PROMPT_SYMBOL="→ "
# PROMPT_SYMBOL=""
# PROMPT_SYMBOL=""
PROMPT_SYMBOL_COLOR=yellow
PROMPT_PATH_COLOR=magenta


### LIB

typeset -U modules_dir="$ZDOTDIR"/prompt/modules
if [[ -d "$modules_dir" ]]; then
    for file in $modules_dir/*.zsh; do
        source $file
    done
fi
unset modules_dir

### SYMBOL
# Change color if the last command didn't works
prompt_symbol() {
    echo "%(?.%F{$PROMPT_SYMBOL_COLOR}.%F{red})$PROMPT_SYMBOL%f "
}

### PATH
# don't show path in ~ and just one if in a git dir
prompt_path() {
    if [[ $PWD = ~ ]]; then
        echo ""
    elif _prompt_is_git; then
        echo "%F{$PROMPT_PATH_COLOR}%1/%f "
    else
        echo "%F{$PROMPT_PATH_COLOR}%~%f "
    fi
}

# Add an !nnn if in nnn cmd mode
prompt_nnn() {
    if [[ -n "$NNNLVL" ]]; then
        echo "%F{red}[nnn] %f"
    fi
}


### ASYNC
# Callback
prompt_async_callback() {
PROMPT='
$(prompt_symbol)$(prompt_nnn)$(prompt_path)$(prompt_git_branch)$(prompt_git_status) '
RPROMPT='$(prompt_exec)'
    zle && zle reset-prompt

    # Stop async worker
    async_stop_worker prompt_async_worker
}


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
    add-zsh-hook preexec _prompt_exec_preexec_hook
    add-zsh-hook precmd _prompt_exec_precmd_hook
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
