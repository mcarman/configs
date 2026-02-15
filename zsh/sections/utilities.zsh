
# Activate zoxide, if installed
[[ -d "$HOME/.config/zoxide" ]] && eval "$(zoxide init zsh)"

# Activate atuin, if installed
[[ -d "$HOME/.config/atuin" ]] && eval "$(atuin init zsh)"

# Activate fzf, and set popup parameters
alias fzf='fd | fzf --height=50% --layout=reverse --info=inline \
  --border --margin=1 --padding=1  --preview 'cat {}' --query .go'

##  --preview-window up,1,border-horizontal \
##   --bind 'ctrl-/:change-preview-window(50%|hidden|)' \

