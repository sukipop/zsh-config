export ZSH_STARTUP_SCRIPTS="${HOME}/startup"

# Check if 'ZSH_STARTUP_SCRIPTS' exists
if [[ ! -d "$ZSH_STARTUP_SCRIPTS" ]]; then
    return 0
fi

# List files in 'ZSH_STARTUP_SCRIPTS'
files=("${ZSH_STARTUP_SCRIPTS}"/*)

# Only proceed if there are files to source
if [[ ! "${#files[@]}" -gt 0 ]]; then
    return 0
fi

# Loop through each file in 'ZSH_STARTUP_SCRIPTS'
for file in "$ZSH_STARTUP_SCRIPTS"/*; do
    # Ensure 'file' is an executable file
    if [[ -f "$file" && -x "$file" ]]; then
        # Source 'file' and handle any errors
        if ! source "$file"; then
            file_name=$(basename "$file")
            warning "Failed to execute startup script: $file_name"
        fi
    fi
done

# Clean up
unset file file_name files
