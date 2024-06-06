export ZSH_FUNCTION_DIR="${ZDOTDIR}/functions"

# Check if 'ZSH_FUNCTION_DIR' exists
if [[ -d "$ZSH_FUNCTION_DIR" ]]; then
    # Gather all files in the directory
    files=("${ZSH_FUNCTION_DIR}"/*)

    # Only proceed if there are files to source
    if [[ -n "${files[1]}" ]]; then
        for file in "${files[@]}"; do
            if [[ -r "$file" && -f "$file" ]]; then
                . "$file"
            fi
        done
    fi
fi
