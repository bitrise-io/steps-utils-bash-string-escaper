#!/bin/bash

source ./bash_string_escape.sh

escapedval=$(bash_string_escape "$1" "$2")
echo "Escaped: $escapedval"