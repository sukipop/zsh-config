export ZSH_PLUGIN_DIR="${ZDOTDIR}/plugins"

# Check if 'ZSH_PLUGIN_DIR' exists
if [[ ! -d "$ZSH_PLUGIN_DIR" ]]; then
    return 0
fi

# List directories in 'ZSH_PLUGIN_DIR'
dirs=("${ZSH_FUNCTION_DIR}"/*)

# Load plugins from the plugins directory
for dir in "${ZSH_PLUGIN_DIR}"/*; do
    if [[ -d "${dir}" ]]; then
        file="${dir}/$(basename ${dir}).zsh"
        if [[ -r "${file}" && -f "${file}" ]]; then
            source "${file}"
        fi
    fi
done

# Clean up
unset dir dirs file
