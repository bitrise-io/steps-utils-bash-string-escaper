#!/bin/bash

function bash_string_escape {
  local somevar="$1"

  if [[ "$2" == "--no-space" ]]; then
    escapedvar=$(echo "${somevar}" | sed -e 's/[^][ a-zA-Z0-9/.:?,;(){}<>=*+-]/\\&/g' )
  else
    escapedvar=$(echo "${somevar}" | sed -e 's/[^][a-zA-Z0-9/.:?,;(){}<>=*+-]/\\&/g' )
  fi

  echo "${escapedvar}"
}