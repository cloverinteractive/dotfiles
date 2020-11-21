# Create this file to load extras before
if [ -f $HOME/.bash/before ]; then
  . $HOME/.bash/before
fi

# Always look first in ./bin or ~/bin
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:./bin:$HOME/bin:$PATH

# Print what our current git branch is
function current_git_branch() {
  git_exists=`git branch 2>/dev/null | sed -ne'/^\* /s///p'`

  if [[ "$git_exists" != "" ]]; then
    if [[ "$git_exists" == "(no branch)" ]]; then
      git_exists="\e[31m\]$git_exists\e[0m\]"
    fi
    echo "$git_exists "
  fi
  unset git_exists
}

# Print how many items there are in our git stash
function current_git_stash() {
  git_stash=`git stash list 2>/dev/null | /usr/bin/wc -l | sed 's/ *//g'`

  if [[ "$git_stash" != "" && $git_stash > 0 ]]; then
    echo "[$git_stash] "
  fi
  unset git_stash
}

# Print smiley or frwony face based on the last command return status
function last_return_status() {
  if [[ $? == 0 ]]; then
    echo "\[\e[0;32m\]☺\[\e[0m\]"
  else
    echo "\[\e[1;31m\]☹\[\e[0m\]"
  fi
}

function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
else
  PROMPT_COMMAND='PS1="$(last_return_status) \[\e[1;31m\]\u\[\e[0m\] \t \[\e[32m\]$(current_git_branch)\[\e[0m\]\[\e[35m\]$(current_git_stash)\[\e[0m\]\[\e[33m\]\w\[\e[0m\] \[\e[1m\]\$\[\e[0m\] "'
fi

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
