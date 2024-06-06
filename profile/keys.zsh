export ZSH_KEY_DIR="${HOME}/.keys"

# Check if 'ZSH_KEY_DIR' exists
if [[ -d "$ZSH_KEY_DIR" ]]; then
    # Gather all files in the directory
    files=("${ZSH_KEY_DIR}"/*)

    # Only proceed if there are files to source
    if [[ "${#files[@]}" -gt 0 ]]; then
        for file in "${files[@]}"; do
            if [[ -r "$file" && -f "$file" ]]; then
                key_name=$(basename "$file")
                key_name=$(echo "$key_name" | tr '[:lower:]' '[:upper:]')
                key=$(head -1 "$file")
                if [[ -n "$key" ]]; then
                    export "$key_name=$key"
                fi
            fi
        done
    fi
fi

# Clean up
unset key key_name file files
