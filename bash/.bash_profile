# Create this file to load extras before
if [ -f $HOME/.bash/before ]; then
  . $HOME/.bash/before
fi

# Update $PATH
if [ -f $HOME/.bash/paths ]; then
  . $HOME/.bash/paths
fi

# Update PS1 and PROMPT_COMMAND
if [ -f $HOME/.bash/prompt ]; then
  . $HOME/.bash/prompt
fi

# Load command aliases
if [ -f $HOME/.bash/aliases ]; then
  . $HOME/.bash/aliases
fi

export PYTHONIOENCODING=UTF-8

# Set editor
export EDITOR=vim
export VISUAL=vim
export GIT_EDITOR='vim -f'

# Set history
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT="%D %T "
export HISTIGNORE="&:ls:exit"
shopt -s histappend

# Set pager settings
export LESS="-R -iMSx2 -FX"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Setup development environment
if [ -f $HOME/.bash/environments ]; then
  . $HOME/.bash/environments
fi

# Create this file to load extras after
if [ -f $HOME/.bash/after ]; then
  . $HOME/.bash/after
fi

# vim: set filetype=sh:
