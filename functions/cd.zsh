function cd {
    local dir dir_name item_count ls_cap venv_dirs
    local venv_dir readme_files readme_file

    # Define 'dir'
    if [[ "$#" -eq 0 ]]; then
        dir="${HOME}"
    else
        dir="$@"
    fi

    # Error checks
    if [[ -f "${dir}" ]]; then
        error "Target is a file"
        return 1
    elif [[ ! -d "${dir}" ]]; then
        error "Not found"
        return 1
    fi

    # Deactivate venv if we are leaving one
    if [[ -n "${VIRTUAL_ENV}" ]] && 
       [[ "${PWD}" != "${HOME}" ]] && 
       [[ "${PWD}" != "${OLDPWD}" ]]; then
        if ! deactivate >/dev/null 2>&1; then
            warning "Failed to deactivate venv"
        fi
    fi

    # Change directory, quoting all arguments to handle spaces in directory names
    if ! builtin cd "${dir}" >/dev/null 2>&1; then
        error "Failed to change directories"
        return 1
    fi

    # Print '.banner' with glow if found
    if [[ -s ".banner" ]]; then
        if ! glow ".banner"; then
            warning "Failed to print banner"
        fi
    fi

    # Count items in the directory and list contents if under or equal to ls_cap
    item_count=$(ls -1A | wc -l)
    ls_cap="100"
    if [[ "${item_count}" -eq 0 ]]; then
        notice "Empty directory"
    elif [[ "${item_count}" -gt "${ls_cap}" ]]; then
        notice "Directory contains ${item_count} items"
    else
        ls --color=auto
    fi

    # Activate venv if found
    venv_dirs=(".venv" "venv" "env")
    for venv_dir in "${venv_dirs[@]}"; do
        if [[ -f "${venv_dir}/bin/activate" ]] &&
           [[ -x "${venv_dir}/bin/python" ]]; then
            if ! source "${venv_dir}/bin/activate"; then
                warning "Failed to activate venv: ${venv_dir}"
            else
                break
            fi
        fi
    done

    # Check if the current directory is part of a Git repository
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        print -n "\n"
        if ! git status; then
            warning "Failed to get git status"
        fi
    fi
}
