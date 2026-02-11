
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nvim'
fi

export TERM="tmux-256color"
export BROWSER="firefox"

