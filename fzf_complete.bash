
fzf_complete() {

    local fzf_complete_home
    
    fzf_complete_home="$(dirname "${BASH_SOURCE[0]}")"

    "$fzf_complete_home/bin/export-completions" "$READLINE_LINE" | fzf

    # TODO: insert selection

}

bind -x '"\e\t": "fzf_complete"'
