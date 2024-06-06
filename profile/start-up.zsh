export ZSH_STARTUP_SCRIPTS="${HOME}/startup"

# Check if 'ZSH_STARTUP_SCRIPTS' exists
if [[ -d "$ZSH_STARTUP_SCRIPTS" ]]; then
  # Loop through each file in the directory
  for file in "$ZSH_STARTUP_SCRIPTS"/*; do
    # Ensure 'file' is an executable file
    if [[ -f "$file" && -x "$file" ]]; then
      # Source the file and handle any errors
      if ! source "$file"; then
        warning "Failed to execute startup script: $file"
      fi
    fi
  done
fi
