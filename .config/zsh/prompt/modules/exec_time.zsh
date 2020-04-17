PROMPT_EXEC_COLOR=red
PROMPT_EXEC_MAX=5

# Human readable time
_prompt_displaytime() { 
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

# Execution time start
_prompt_exec_preexec_hook() {
    PROMPT_EXEC_TIME_start=$(date +%s)
}

# Execution time end
_prompt_exec_precmd_hook() {
    [[ -n $PROMPT_EXEC_TIME_duration ]] && unset PROMPT_EXEC_TIME_duration
    [[ -z $PROMPT_EXEC_TIME_start ]] && return
    local prompt_exec_time_stop
    prompt_exec_time_stop=$(date +%s)
    PROMPT_EXEC_TIME_duration=$(( prompt_exec_time_stop - PROMPT_EXEC_TIME_start ))
    unset PROMPT_EXEC_TIME_start
}

# Display exec time
prompt_exec() {
    if [[ $PROMPT_EXEC_TIME_duration -ge $PROMPT_EXEC_MAX ]]; then
        echo "%F{$PROMPT_EXEC_COLOR}$(_prompt_displaytime $PROMPT_EXEC_TIME_duration)%f"
    fi 
}

