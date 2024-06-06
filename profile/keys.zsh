export ZSH_KEY_DIR="${HOME}/.keys"

# Check if 'ZSH_KEY_DIR' exists
if [[ ! -d "$ZSH_KEY_DIR" ]]; then
    return 0
fi

# List files in 'ZSH_KEY_DIR'
files=("${ZSH_KEY_DIR}"/*)

# Only proceed if there are files to source
if [[ ! "${#files[@]}" -gt 0 ]]; then
    return 0
fi

#  
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

# Clean up
unset key key_name file files
