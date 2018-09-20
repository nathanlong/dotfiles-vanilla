#-----------------------------------------------------------------------------
# ALIASES
#-----------------------------------------------------------------------------

# Basic navigation
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias -- -="cd -"

# Fancy lists
alias ll='ls -laF'       # long form, everything
alias lo='ls -oG'        # long form, no user group, no hidden
alias lt='ls -toaG'      # order by last modified, everything
alias lf='ls -AGFoh'     # long form, no user, file size

alias zz='exit'          # quick exit

#-----------------------------------------------------------------------------
# OPTIONS
#-----------------------------------------------------------------------------

# Enable list colors
export CLICOLOR=1

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

#-----------------------------------------------------------------------------
# EXPORTS
#-----------------------------------------------------------------------------

# Make vim the default editor
export EDITOR="vim"

# Make some commands not show up in history
export HISTIGNORE="ls:ls *:ll:lf:cd:cd -:pwd;exit:date:* --help:zz:.."
