# Create this file to load extras before
if [ -f $HOME/.config/bash/before ]; then
  . $HOME/.config/bash/before
fi

# Update $PATH
if [ -f $HOME/.config/bash/paths ]; then
  . $HOME/.config/bash/paths
fi

# Update PS1 and PROMPT_COMMAND
if [ -f $HOME/.config/bash/prompt ]; then
  . $HOME/.config/bash/prompt
fi

# Load command aliases
if [ -f $HOME/.config/bash/aliases ]; then
  . $HOME/.config/bash/aliases
fi

shopt -s histappend

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
if [ -f $HOME/.config/bash/environments ]; then
  . $HOME/.config/bash/environments
fi

# Create this file to load extras after
if [ -f $HOME/.config/bash/after ]; then
  . $HOME/.config/bash/after
fi

# vim: set filetype=sh:
