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

export PYTHONIOENCODING=UTF-8

# What services are listening for connections
alias listening="lsof -Pan -iTCP -sTCP:listen"

DIRCOLORS_PATH=`which dircolors`

if [ -x $DIRCOLORS_PATH ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

export EDITOR=vim

export VISUAL=vim
export GIT_EDITOR='vim -f'

# Bash completition for ubuntu (from default .bashrc in ubuntu)
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT="%D %T "
export HISTIGNORE="&:ls:exit"
shopt -s histappend
export LESS="-R -iMSx2 -FX"

# Create this file to load extras after
if [ -f $HOME/.bash/after ]; then
  . $HOME/.bash/after
fi

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

# vim: set filetype=sh :
