export ZSH_FUNCTION_DIR="${ZDOTDIR}/functions"

# Check if 'ZSH_FUNCTION_DIR' exists
if [[ ! -d "$ZSH_FUNCTION_DIR" ]]; then
    return 0
fi

# List files in 'ZSH_FUNCTION_DIR'
files=("${ZSH_FUNCTION_DIR}"/*)

# Only proceed if there are files to source
if [[ ! "${#files[@]}" -gt 0 ]]; then
    return 0
fi

# Loop through each file in 'ZSH_FUNCTION_DIR'
for file in "${files[@]}"; do
    # Check if 'file' is a file
    if [[ ! -f "$file" ]]; then
        continue
    fi

    # Check if 'file' is readable
    if [[ ! -r "$file" ]]; then
        continue
    fi

    # Check if 'file' contains content
    if [[ ! -s "$file" ]]; then
        continue
    fi

    # Source 'file' and handle any errors
    if ! source "$file"; then
        file_name=$(basename "$file")
        warning "Failed to load function: $file_name"
    fi
done

# Clean up
unset file file_name files
