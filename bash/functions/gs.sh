#!/usr/bin/env bash

function gs () {
  echo -e "";
  echo -e "*********************************************";
  echo -e "   ${COLOUR_RED}DO NOT FORGET TO PULL BEFORE COMMITTING${COLOUR_RESET}";
  echo -e "*********************************************";
  echo -e "";
  git status;
}
