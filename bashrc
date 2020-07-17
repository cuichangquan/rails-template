# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# About work
if [ -f ~/.public_alias ]; then
  . ~/.public_alias
fi

if [ -f ~/.private_alias ]; then
  . ~/.private_alias
fi

source ~/.fzf.bash

# Useing direnv
eval "$(direnv hook bash)"

. `brew --prefix`/etc/profile.d/z.sh
