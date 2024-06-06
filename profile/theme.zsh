export ZSH_THEME_DIR="${ZDOTDIR}/themes"
export ZSH_THEME="powerlevel10k"

# Ensure 'ZSH_THEME_DIR' exists
mkdir -p "${ZSH_THEME_DIR}"

# Enable theme
file="${ZSH_THEME_DIR}/${ZSH_THEME}/${ZSH_THEME}.zsh-theme"

if [[ -r "${file}"  ]] &&
   [[ -f "${file}" ]]; then
    # Enable theme
    if ! source "${file}"; then
        warning "Failed to source file: ${file}"
    fi
else
    unset ZSH_THEME
fi

# Clean up
unset file
