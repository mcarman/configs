## created 2024.JAN.6
## last updated 2025.MAY.19

## to handle
setopt EXTENDED_GLOB
setopt NULL_GLOB
setopt GLOBDOTS

## +-------------+
#  | Local Paths |
## +-------------+

function notify-send() {
    #Detect the name of the display in use
    local display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"

    #Detect the user using such display
    local user=$(who | grep '('$display')' | awk '{print $1}' | head -n 1)

    #Detect the id of the user
    local uid=$(id -u $user)

    sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus notify-send "$@"
}

## Note: there are bash files in /etc/profile.d/
# including: nvim, cargo,

# basic local paths
PATH="$PATH:$HOME/.local/share/bin:$XDG_CONFIG_HOME/fvm/bin:/usr/share/zig"

## path and init for tmuxifier if installed
#if [[ -d "$HOME/.config/tmuxifier" ]] ; then
#  eval "$(tmuxifier init -)" && \
#  export TMUXIFIER_LAYOUT_PATH="$XDG_CONFIG_HOME/tmuxifier/tmux-layouts"
#fi

## add rust/cargo to path
PATH=$PATH:"$HOME/.cargo/bin/bin:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin"

## add go path
PATH=$PATH:/usr/local/go/bin

## add zig path
PATH="$PATH:/usr/share/zig"

# init for atuin if installed
# if [ -d "$HOME/.config/atuin" ] ; then
#   eval "$(atuin init zsh)"
# fi

#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

## Call pyenv
#set-pyenv() {
#  eval "$(pyenv virtualenv-init -)"
#}

## Remove duplicate PATH entries and export
[[ ":$PATH:" =~ ":/new-directory:" ]] || PATH="/new-directory:$PATH"
export PATH

# source /home/mdc1/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

## +-------------------------+
#  | Environmental Variables |
## +-------------------------+

## History Settings

## Size of the history file
export SAVEHIST=5000

## size of the save file
export HISTSIZE=10000

## Append, not replace, the history file
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

## Share over multiple shell logins
setopt SHARE_HISTORY

## Alternative to the directory stack
# autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
# add-zsh-hook chpwd chpwd_recent_dirs
# zstyle ':completion:*:*:cdr:*:*' menu selection


## Preferred Programs, editor for local and remote sessions
if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR='nano'
else
  export EDITOR='nvim'
fi

export TERM="tmux-256color"
# export BROWSER="firefox"
export VISUAL="nvim"

## Edit the commandline like nvim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

## Neovim location
alias nvim='/opt/nvim/nvim-linux-x86_64/bin/nvim'

## call direnv for directory level env's
eval "$(direnv hook zsh)"

## +--------+
#  | Prompt |
#  +--------+

# [](bg:#769ff0 fg:#a3aed2)\

## Define Colors
mycol11='#E5E9F0'
mycol12='#3b4252'
mycol13='#ECEFF4'
mycol14='#4c566a'
mycol15='#32302f'
mycol16='#d5c4a1'
mycol17='#3c3836'
mycol18='#504945'
mycol19='#2E3440'
NEWLINE=$'\n'
C1='#E5E9F0' #
C2='#3b4252' #
C4='#4c566a' #
C5='#32302f' #
C6='#d5c4a1' #
C7='#3c3836' #
C8='#504945' #
C9='#2E3440' #



# left_sep = "\uE0B4"
# right_sep = "\
# rt_rnd= %F{$mycol13}%K{$mycol14}%f%k
# echo $rt_rnd

## nord-ish theme
PROMPT="${NEWLINE}%K{$mycol19}%F{$mycol11}$(date +%_I:%M%P) %K{$mycol12}%F{$mycol13} %n %k%F{$mycol19}%f"

## warm theme
# PROMPT="${NEWLINE}%K{$mycol15}%F{$mycol16} $0 %K{$mycol17}%F{$mycol16} %n %F{$mycol18}%k %f"

## pywal colors
# PROMPT="${NEWLINE}%K{$COL0}%F{$COL1}$(date +%_I:%M%P) %K{$COL0}%F{$COL2} %n %K{$COL3} %~%%f%k "

## one time print with nord-ish theme
echo -e "${NEWLINE}\033[48;2;46;52;64;38;2;216;222;233m $0 \033[0m\033[48;2;59;66;82;38;2;216;222;233m $(uptime -p | cut -c 4-) \033[0m\033[48;2;52;64;233;38;2;216;222;233m $(uname -r) \033[0m"

# echo -e "\[\e[91m\]\u\[\e[38;5;208m\]@\[\e[92m\]\h:\[\e[96m\]\$PWD\[\e[35m\]//$(date +"%D-%H:%M" | sed 's/\//-/g')\n\[\e[38;5;21m\][$]~> \[\e[0m\] " 

# echo '\[\e[0m\]\[\e[48;5;236m\]\[\e[38;5;105m\]\u\[\e[38;5;105m\]@\[\e[38;5;105m\]\h\[\e[38;5;105m\] \[\e[38;5;221m\]\w\[\e[38;5;221m\]\[\e[38;5;105m\]\[\e[0m\]\[\e[38;5;236m\]\342\226\214\342\226\214\342\226\214\[\e[0m\]'

echo -e "${NEWLINE}\x1b[38;5;137m\x1b[48;5;0m it is $(date +%_I:%M%P) \x1b[38;5;180m\x1b[48;5;0m up: $(uptime -p | cut -c 4-) \x1b[38;5;223m\x1b[48;5;0m $(uname -o) $(uname -r) \033[0m " # warmer theme

# PROMPT_COMMAND="PS1_CMD1=$(__git_ps1  (%s))"; PS1="\[\e]0; \t\n\u@\H:\w${PS1_CMD1} > " # other prompt with git

## +------------------------+
#  | Miscellaneous Settings |
## +------------------------+

## fix error message for completions
# export fpath="(/usr/share/zsh/plugins/vendor-completions $fpath)"

# Fix bracket paste in zle for tmux only:
if [[  "$TERM" =~ .*tmux.* ]]; then
	 unset zle_bracketed_paste
fi

## +------------+
#  | FZF Finder |
## +------------+

## Source fzf
[ -f ~/.fzf.zsh ] && source <(fzf --zsh)

autoload -U compinit; compinit

# path and init for zoxide if installed
# must load AFTER compinit per zoside install
if [[ -d "$XDG_CONFIG_HOME/zoxide" ]] ; then
  eval "$(zoxide init zsh)"
fi

## Fuzzy finder, load before autosuggestion and syntax highlighting
source "$HOME/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"
# source $XDG_CONFIG_HOME/fzf/completion.zsh
# source $XDG_CONFIG_HOME/fzf/key-bindings.zsh

## fzf-tab configuration
## disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
## set descriptions format to enable group support
## NOTE: dont use escape sequences (like %F{red}%d%f) here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
## set list-colors to enable filename colorizing
zstyle ':completion:*' 'list-colors' # ${s..:LS_COLORS}
## force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
## preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always' # $realpath
## custom fzf flags
## NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
## To make fzf-tab follow FZF_DEFAULT_OPTS.
## NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
## switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

## Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS='
  --walker-skip .git,node_modules,target
  --preview "bat -n --color=always {}"
  --bind "ctrl-/:change-preview-window(down|hidden|)"
  '

## CTRL-C options
export FZF_ALT_C_OPTS='
  --walker-skip .git,node_modules,target
  --preview "tree -C {}"
  '

## CTRL-R to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS='
  --bind "ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort"
  --color header:italic
  --header "Press CTRL-Y to copy command into clipboard"
  '
# alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

## configure fzf pop up.
alias fzf=fzf --style full \
    --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'


## tomasr/molokai
#export FZF_DEFAULT_OPTS=' fd
 # --hidden'
# export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'

#  --height 40%
#  --tmux bottom,80%,40%
#  --layout reverse
#  --border top
#  --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
#  --color=fg:#CDD5F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
#  --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
#  --color=selected-bg:#45475A \
#  --color=border:#6C7086,label:#CDD6F4
#  '
#  --color="bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672"
#'

##+----------+
#|  Zoxide  |
#+----------+
unalias z 2> /dev/null

## for zoxide set up, 
export _ZO_ECHO='1'

z() {
  local dir=$(
    zoxide query --list --score |
    fzf --height 40% --layout reverse --info inline \
        --nth 2.. --tac --no-sort --query "$*" \
        --bind 'enter:become:echo {2..}'
  ) && cd "$dir"
}

zi() {
  local dir
  dir=$(zoxide query -l | fzf) && z "$dir"
 }

## set up asdf
fpath=(${ASDF_DATA_DIR:-$HOME/.config/.asdf}/completions $fpath)
autoload -Uz compinit && compinit


##+------------------------------- +
# |  Autosuggestion / Completion  |
#+-------------------------------+

#source "$HOME/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
zle -N menu-search
zle -N recent-paths
zle -N insert-unambiguous-or-complete

## Completions
# # source "$HOME/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh"

## Syntax highlighting/
# source "$HOME/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

##+------------+
# |  Aliases  |
# +-----------+

## add aliases file if it is not empty
if [ ! -s "$HOME/.config/zsh/aliases/aliases.zsh" ]; then
  . "$HOME/.config/zsh/aliases/aliases.zsh"
fi

## mnt fs over sshfs
alias msfs='sudo sshfs -o allow_other,default_permissions pims@10.0.0.238:/opt/stacks/mserver /mnt/mserver/pims'

## alias for update 20241010
alias udatey='sudo aptitude update && sudo aptitude upgrade -y'

## eza aliases
alias ls='eza -F -gh --group-directories-first --icons --color-scale all --git ${EZA_GIT_IGNORE}' #--icons --color-scale all --hyperlink"
alias lh='ls -d .*'
alias lD='ls -D'
alias lc='ls -1'
alias lt='ls -T'
alias tree='lt'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'


## Grid views
alias els='eza --icons --group-directories-first'
alias ela='eza -a --icons --group-directories-first'

## Minimal list views (size, relative date, name)
alias ell='eza -l --icons --group-directories-first --no-permissions --no-user --time-style=relative'
alias ella='eza -la --icons --group-directories-first --no-permissions --no-user --time-style=relative'

## eza Filters
alias eld='eza --icons --group-directories-first --only-dirs'
alias elf='eza --icons --group-directories-first --only-files'

## Git status views
function elg  { eza -l --icons --git --group-directories-first --no-permissions --no-user --time-style=relative $args }
function elga { eza -la --icons --git --group-directories-first --no-permissions --no-user --time-style=relative $args }

## Tree views
function tv  { eza --tree -L 2 --icons --group-directories-first $args }
function ttv { eza --tree -L 4 --icons --group-directories-first $args }

## Filters
function eld { eza --icons --group-directories-first --only-dirs $args }
function elf { eza --icons --group-directories-first --only-files $args }

# alias cat='batcat -n --color=always {}'
alias tailf='tail -f /var/log/sysctl.log | bat --paging=never -l log'

# export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
# man 2 select

## colorized help files
alias bhelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# . "$HOME/.local/share/../bin/env"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Alias for running starkup installer
alias starkup="curl --proto '=https' --tlsv1.2 -sSf https://sh.starkup.sh | sh -s --"

# BEGIN SCARB COMPLETIONS
_scarb() {
  if ! scarb completions zsh >/dev/null 2>&1; then
    return 0
  fi
  eval "$(scarb completions zsh)"
  _scarb "$@"
}

compdef _scarb scarb
# END SCARB COMPLETIONS

# BEGIN FOUNDRY COMPLETIONS
_snforge() {
  if ! snforge completions zsh >/dev/null 2>&1; then
    return 0
  fi
  eval "$(snforge completions zsh)"
  _snforge "$@"
}

_sncast() {
  if ! sncast completions zsh >/dev/null 2>&1; then
    return 0
  fi
  eval "$(sncast completions zsh)"
  _sncast "$@"
}

compdef _snforge snforge
compdef _sncast sncast
# END FOUNDRY COMPLETIONS

# pnpm
export PNPM_HOME="/home/carma/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
