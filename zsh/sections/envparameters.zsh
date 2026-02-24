
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='/usr/bin/nano'
else
  export EDITOR='/usr/bin/nvim'
fi

export TERM='tmux-256color'
export BROWSER='firefox'
export VISUAL='/usr/bin/nvim'
