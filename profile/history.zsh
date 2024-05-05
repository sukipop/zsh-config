# History Configuration
export HISTFILE="$ZDOTDIR/.history"
export HISTSIZE=25000         # How many lines of history to keep in memory
export SAVEHIST=25000         # How many lines of history to save to disk
export HISTTIMEFORMAT="%S "   # Format history timestamps as 'YYYY-MM-DD HH:MM:SS'

# History Behavior
setopt APPEND_HISTORY         # Append history entries as they are generated, not at shell exit
setopt SHARE_HISTORY          # Share history across terminals
setopt INC_APPEND_HISTORY     # Add commands to HISTFILE in order of execution
setopt HIST_EXPIRE_DUPS_FIRST # Remove duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS   # Ignore duplication under all conditions
setopt HIST_FIND_NO_DUPS      # Don’t display duplicates in history search
setopt HIST_IGNORE_SPACE      # Ignore commands that start with space
setopt HIST_SAVE_NO_DUPS      # Do not write a command to the history file if it is a duplicate
setopt HIST_VERIFY            # Don't execute immediately on history expansion
setopt HIST_BEEP              # Beep when a history expansion fails
