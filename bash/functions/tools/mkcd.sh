#!/usr/bin/env bash

function mkcd () {
  mkdir "$@";
  cd "$@";

  return 0;
}
