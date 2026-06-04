#!/usr/bin/env bash
# which says this is about tput colours ... which it doesn't (directly)
# use.
# Prints out a compact list of colors available in 256 color linux terminals

bgcolour() {
  for c; do
    printf '\e[48;5;%dm %03d ' "${c}" "${c}"
  done
  printf '\e[0m \n'
}

fgcolour() {
  for c; do
    printf '\e[38;5;%dm %03d ' "${c}" "${c}"
  done
  printf '\e[0m \n'
}

IFS=$' \t\n'
echo "Base colours:"
bgcolour {0..15}
fgcolour {0..15}
echo ""
echo "More than 16 colours (fine on Mac, Fedora, probably breaks on default Debian):"
for ((i = 0; i < 6; i++)); do
  bgcolour $(seq $((i * 36 + 16)) $((i * 36 + 27)))
  fgcolour $(seq $((i * 36 + 16)) $((i * 36 + 27)))
  bgcolour $(seq $((i * 36 + 28)) $((i * 36 + 39)))
  fgcolour $(seq $((i * 36 + 28)) $((i * 36 + 39)))
  bgcolour $(seq $((i * 36 + 40)) $((i * 36 + 51)))
  fgcolour $(seq $((i * 36 + 40)) $((i * 36 + 51)))
done
echo ""
echo "Shades of gray (fine on Mac, Fedora, probably breaks on default Debian):"
bgcolour {232..243}
fgcolour {232..243}
bgcolour {244..255}
fgcolour {244..255}

echo ""
echo -e "Example colour gradient: \033[48;5;005m \033[48;5;201m \033[48;4;207m \033[48;5;213m \033[48;5;218m \033[48;5;224m \033[48;5;229m \033[48;5;011m \033[0m (005,201,207,213,218,224,229,011)"

#!/bin/sh

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

for fgbg in 38 48; do # Foreground / Background
  for color in $( # Colors
    seq 0 255
  ); do
    # Display the color
    printf "\e[${fgbg};5;%sm %3s \e[0m" $color $color
    # Display 6 colors per lines
    if [ $((($color + 1) % 6)) == 4 ]; then
      echo # New line
    fi
  done
  echo # New line
done

exit 0
