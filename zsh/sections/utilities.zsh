
# Activate zoxide, if installed
[[ -d "$HOME/.config/zoxide" ]] && eval "$(zoxide init zsh)"

# Activate atuin, if installed
# [[ -d "$HOME/.config/atuin" ]] && eval "$(atuin init zsh)"

# Initiate tmuxinator
# [[ -d "$HOME/.config/tmuxinator" ]]

# Initiate fzf, and set popup parameters
# Enable fzf
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"


# Initiate brew for homebrew installations
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

##  --preview-window up,1,border-horizontal \
##   --bind 'ctrl-/:change-preview-window(50%|hidden|)' \

