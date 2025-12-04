
_fzf_complete_home="$(dirname "${BASH_SOURCE[0]}")"

fzf_complete() {

    # before and after cursor
    local before="${READLINE_LINE:0:READLINE_POINT}"
    local after="${READLINE_LINE:READLINE_POINT:${#READLINE_LINE}}"

    local options

    if ! options=$("$_fzf_complete_home/bin/export-completions" "$before"); then
        return
    fi

    local root=$(sed -n '2 p' <<< "$options")
    local start=$(sed -n '3 p' <<< "$options" | cut -d: -f1)
    local options=$(sed -n '4,$ p' <<< "$options")

    local selection

    selection=$(fzf --query="$root" --prompt="Suggestions> " <<< "$options") || return 1

    if [ -n "$selection" ]; then
        # cut before root
        before="${before:0:start}"

        # insert selection
        READLINE_LINE="$before$selection$after"
        READLINE_POINT=$(( ${#before} + ${#selection} ))
    fi

}

bind -x '"\e\t": "fzf_complete"'
