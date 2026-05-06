
## HOME Directory
# export HOME=/home/carma

## Source cargo Directories
. "$HOME/.cargo/bin/env"

# Define XDG base directories
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.local/run"
export XDG_STATE_HOME="$HOME/.local/state"

create_xdg_basedirs() {
  # ANSI color codes
  local green='\033[0;32m' # Green
  local cyan='\033[0;36m'  # Cyan
  local red='\033[0;31m'   # Red
  local nc='\033[0m'       # No Color

  local entry var dir
  for entry in \
    "XDG_BIN_HOME=$XDG_BIN_HOME" \
    "XDG_CACHE_HOME=$XDG_CACHE_HOME" \
    "XDG_CONFIG_HOME=$XDG_CONFIG_HOME" \
    "XDG_DATA_HOME=$XDG_DATA_HOME" \
    "XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR" \
    "XDG_STATE_HOME=$XDG_STATE_HOME"; do

    var="${entry%%=*}"
    dir="${entry#*=}"

    # Only under $HOME and not already existing
    if [[ $dir == "$HOME/"* && ! -d $dir ]]; then
      if mkdir -p "$dir"; then
        printf '[%b%s%b] Created directory: %b%s%b\n' \
          "$green" "$var" "$nc" \
          "$cyan" "$dir" "$nc"
      else
        printf '[%b%s%b] Failed to create directory: %b%s%b\n' \
          "$red" "$var" "$nc" \
          "$cyan" "$dir" "$nc" >&2
      fi
    fi
  done
}

# set zsh home directory
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# histfiles
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"

# other file relos
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export CARGO_HOME="$HOME/.cargo/bin"
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="/usr/local/go/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export BAT_CONFIG_DIR="$XDG_CONFIG_HOME/bat"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"
# export YAZI_CONFIG_DIR= "XDG_CONFIG_HOME/yazi"
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config
export ASDF_DATA_DIR="$XDG_CONFIG_HOME/.asdf"
# set system paths
export PATH="$PATH:/usr/bin:/usr/share:/usr/local/:$HOME/.local/bin:$HOME/.local/share/cargo/bin:$XDG_CONFIG_HOME/scripts:$XDG_BIN_HOME/go"
typeset -U path
export PATH

## use compinit in .zshrc
skip_global_compinit=1

## colored less + termcap vars
# export LESS="R --use-color -Dd+r -Du+b"
# export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
# export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
# export LESS_TERMCAP_me="$(printf '%b' '[0m')"
# export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
# export LESS_TERMCAP_se="$(printf '%b' '[0m')"
# export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
# export LESS_TERMCAP_ue="$(printf '%b' '[0m')"


export PATH="$PATH:/home/carma/.local/bin"
. "/home/carma/.cargo/bin/env"
