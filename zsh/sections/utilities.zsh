
# Activate atuin
[ -d "$HOME/.config/zoxide" ] && eval "$(zoxide init zsh)"

# directory and init for atuin if installed
[ -d "$HOME/.config/atuin" ] && eval "$(atuin init zsh)"

# Activate fuzzy completion & configure fzf
[ -f $HOME/.fzf.zsh ] && source "$HOME/.fzf.zsh"

alias fzf='fd | fzf --height=50% --layout=reverse --info=inline \
  --border --margin=1 --padding=1  --preview 'cat {}' --query .go'

##  --preview-window up,1,border-horizontal \
##   --bind 'ctrl-/:change-preview-window(50%|hidden|)' \

# load aliases
[ ! -s "$ZDOTDIR/aliases/aliases.zsh" ] && source "$ZDOTDIR/aliases/aliases.zsh"

## Use  bat for colorization
alias bat="batcat --color=always --style=numbers --line-range=:500"
alias cat="bat"  # --theme-dark default --theme-light GitHub

# TMUX setup
alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"
alias xclip="xclip >/dev/null"

# file aliases
alias ls='eza --icons -F -H --group-directories-first --git -1'
alias ll='ls -alF'


