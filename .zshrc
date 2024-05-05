# Check for debug mode
if [[ -f "$HOME/.debug"      ]] ||
   [[ -f "$HOME/.zdebug"     ]] ||
   [[ -f "$ZDOTDIR/.debug"   ]] ||
   [[ -f "$ZDOTDIR/.zdebug"  ]] ||
   [[ "${DEBUG:l}" =~ ^(1|on|yes|y|true|enabled)$  ]] ||
   [[ "${ZDEBUG:l}" =~ ^(1|on|yes|y|true|enabled)$ ]]; then
    export DEBUG="1"

    # Debugging start-up message
    debug "Sourcing file: $ZDOTDIR/.zshrc"
else
    export DEBUG="0"
fi

# Function to source files in a directory
function source_config_dir {
    local dir="$1"
    local file files

    # Ensure directory exists
    mkdir -p "$dir"

    # Temporarily disable the nomatch option to handle no file matches gracefully
    setopt localoptions nonomatch

    # Gather all files in the directory
    files=("${dir}"/*)

    # Only proceed if there are files to source
    if [[ -n ${files[1]} ]]; then
        for file in "${files[@]}"; do
            if [[ -r "$file" && -f "$file" ]]; then
                . "$file"
            fi
        done
    fi

    # Re-enable the nomatch option if it was originally set
    unsetopt localoptions nonomatch
}

# Add user-specific bins to PATH if they exist
for dir in "$HOME/bin" "$HOME/.local/bin"; do
    [[ -d "$dir" ]] && export PATH="$dir:$PATH"
done

# Source files from various directories
if [[ -d "$ZDOTDIR/profile" ]]; then
    source_config_dir "$ZDOTDIR/profile"
fi
if [[ -d "$ZDOTDIR/functions" ]]; then
    source_config_dir "$ZDOTDIR/functions"
fi
export ZSH_ALIAS_DIR="$ZDOTDIR/aliases"
if [[ -d "$ZSH_ALIAS_DIR" ]]; then
    source_config_dir "$ZSH_ALIAS_DIR"
fi
if [[ -d "$ZDOTDIR/variables" ]]; then
    source_config_dir "$ZDOTDIR/variables"
fi

# Clean up
unfunction source_config_dir
