
autoload promptinit ; promptinit

NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{#2E3440}%F{#E5E9F0}$(date +%_I:%M%P) \
  %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k%F{#4c566a}" # nord theme

RPROMPT="%K{#2E3440}%F{#E5E9F0}$(date +%_I:%M%P)%K{#2E3440}%F{#2E3440}"

#RPROMPT="%K{#2E3440}%F{#4c566a}$(date +%_I:%M%P)%F{#4c566a}"

# PROMPT="${NEWLINE}%K{#32302f}%F{#d5c4a1} $0 %K{#3c3836}%F{#d5c4a1} \
# %n %K{#504945} %~ %f%k ❯ " # warmer theme

# PROMPT="${NEWLINE}%K{$COL0}%F{$COL1}$(date +%_I:%M%P) %K{$COL0}%F{$COL2} \
# %n %K{$COL3} %~ %f%k ❯ " # pywal colors, from postrun script

echo -e "${NEWLINE}\033[48;2;46;52;64;38;2;216;222;233m $0 \033[0m\033[48;2;59;66;82;38;2;216;222;233m\
  $(uptime -p | cut -c 4-) \033[0m\033[48;2;76;86;106;38;2;216;222;233m $(uname -r)\033[0m" # nord theme

# echo -e "${NEWLINE}\x1b[38;5;137m\x1b[48;5;0m it's$(date +%_I:%M%P) \x1b[38;5;180m\x1b[48;5;0m \
# $(uptime -p | cut -c 4-) \x1b[38;5;223m\x1b[48;5;0m $(uname -r) \033[0m" # warmer theme

# simple right prompt with time
# PS1="%F{#008000}%B%n@%m%b %1~:%f"
# RPROMPT="%t"
# PROMPT="%m %d"
# RPROMPT="Last cmd: %? t:%T"
