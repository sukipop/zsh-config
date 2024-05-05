# Define ZSH_PLUGIN_DIR
export ZSH_PLUGIN_DIR="$ZDOTDIR/plugins"

# Ensure plugins directory exists
mkdir -p "$ZSH_PLUGIN_DIR"

# Load plugins from the plugins directory
for dir in "$ZSH_PLUGIN_DIR"/*; do
    if [[ -d "$dir" ]]; then
        file="$dir/$(basename $dir).zsh"
        if [[ -r "$file" && -f "$file" ]]; then
            source "$file"
        fi
    fi
done
