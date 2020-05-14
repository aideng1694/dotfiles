#!/usr/bin/env bash

function bash-login () {
  fortune | cowsay -f tux;

  if [[ $LOGIN_SHELL -eq 1 ]]; then
    echo "It's a login shell. I'll find something to do with this later."
  fi
}
