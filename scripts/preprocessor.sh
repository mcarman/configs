#!/bin/sh

case "$1" in
*.pdf)
  # The -s flag ensures that the file is non-empty.
  if [ -s "$1" ]; then
    exec pdftotext - -
  else
    exec cat
  fi
  ;;
*)
  exec cat
  ;;
esac
