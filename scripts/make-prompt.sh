#!/bin/env bash

# Original Author: Caesar Kabalan
#    Modifications : Aadesh
#    Where:
#       CWD - Current working directory (green if last command returned 0, red otherwise)
#       COUNT - Session command count
#       BRANCH - Current git branch if in a git repository, omitted if not in a git repo
#       VENV - Current Python Virtual Environment if set, omitted if not set
#       USER - Current username
#       HOSTNAME - System hostname
function set_bash_prompt() {
  # Color codes for easy prompt building
  COLOR_DIVIDER="\[\e[30;1m\]"
  COLOR_CMDCOUNT="\[\e[36;1m\]"
  COLOR_USERNAME="\[\e[33;1m\]"
  COLOR_DIVIDER="\[\e[31;1m\]"
  COLOR_USERHOSTAT="\[\e[31;1m\]"
  COLOR_HOSTNAME="\[\e[33;1m\]"
  COLOR_GITBRANCH="\[\e[33;1m\]"
  COLOR_VENV="\[\e[33;1m\]"
  COLOR_GREEN="\[\e[32;1m\]"
  COLOR_PATH_OK="\[\e[32;1m\]"
  COLOR_PATH_ERR="\[\e[31;1m\]"
  COLOR_NONE="\[\e[0m\]"
  # Change the path color based on return value.
  if test $? -eq 0; then
    PATH_COLOR=${COLOR_PATH_OK}
  else
    PATH_COLOR=${COLOR_PATH_ERR}
  fi
  # Set the PS1 to be "[workingdirectory:commandcount"
  PS1="${COLOR_DIVIDER}[${PATH_COLOR}\w${COLOR_DIVIDER}:${COLOR_CMDCOUNT}\#${COLOR_DIVIDER}"
  # Add git branch portion of the prompt, this adds ":branchname"
  if ! git_loc="$(type -p "$git_command_name")" || [ -z "$git_loc" ]; then
    # Git is installed
    if [ -d .git ] || git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      # Inside of a git repository
      GIT_BRANCH=$(git symbolic-ref --short HEAD)
      PS1="${PS1}:${COLOR_GITBRANCH}${GIT_BRANCH}${COLOR_DIVIDER}"
    fi
  fi
  # Add Python VirtualEnv portion of the prompt, this adds ":venvname"
  if ! test -z "$VIRTUAL_ENV"; then
    PS1="${PS1}:${COLOR_VENV}$(basename \"$VIRTUAL_ENV\")${COLOR_DIVIDER}"
  fi
  # Close out the prompt, this adds "]\n[username@hostname] "
  PS1="${PS1}]\n${COLOR_DIVIDER}[${COLOR_USERNAME}\u${COLOR_USERHOSTAT}@${COLOR_HOSTNAME}\h${COLOR_DIVIDER}]${COLOR_NONE} "
}

# Tell Bash to run the above function for every prompt
export PROMPT_COMMAND=set_bash_prompt

# tab completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# use colours in the prompt
[[ -f ~/.dir_colors ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs} ]] &&
  type -P dircolors >/dev/null &&
  match_lhs=$(dircolors --print-database)

if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]]; then

  if type -P dircolors >/dev/null; then
    if [[ -f ~/.dir_colors ]]; then
      eval $(dircolors -b ~/.dir_colors)
    elif [[ -f /etc/DIR_COLORS ]]; then
      eval $(dircolors -b /etc/DIR_COLORS)
    fi
  fi

  PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

else

  PS1="\u@\h \w \$([[ \$? != 0 ]] && echo \":( \")\$ "

fi
