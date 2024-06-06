export ZSH_ALIAS_DIR="${ZDOTDIR}/aliases"

# Check if 'ZSH_ALIAS_DIR' exists
if [[ -d "$ZSH_ALIAS_DIR" ]]; then
    # Gather all files in the directory
    files=("${ZSH_ALIAS_DIR}"/*)

    # Only proceed if there are files to source
    if [[ -n "${files[1]}" ]]; then
        for file in "${files[@]}"; do
            if [[ -r "$file" && -f "$file" ]]; then
                . "$file"
            fi
        done
    fi
fi
