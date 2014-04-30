#!/bin/bash

function bash_string_escape {
  somevar="$1"

  if [[ "$2" == "--no-space" ]]; then
    escapedvar="$(echo $somevar | sed 's/[^a-zA-Z0-9\ \/\.\-\:\?\,\;\(\)\[\]\{\}\<\>\=\*\+]]/\\&/g' )"
  else
    escapedvar="$(echo $somevar | sed 's/[[^a-zA-Z0-9\\/.\-\:\?\,\;\(\)\[\]\{\}\<\>\=\*\+]]/\\&/g' )"
  fi

  echo $escapedvar
}