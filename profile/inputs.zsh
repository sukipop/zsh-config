# Use emacs keybindings
bindkey -e

# Navigation keybindings
bindkey '^[[H' beginning-of-line     # Home key
bindkey '^[[F' end-of-line           # End key
bindkey '^[[5~' scroll-up-command    # Page Up
bindkey '^[[6~' scroll-down-command  # Page Down

# Additional bindings for tmux navigation could be added here if needed.
# Note: Direct tmux control through zsh bindkey is limited. You might prefer
# using tmux's own bind-key functionality in .tmux.conf for more complex actions.

bindkey '^X^E' exit-shell-widget

# Swap '€' '$' because my thumbs move so fast
bindkey -s '€' '$'
