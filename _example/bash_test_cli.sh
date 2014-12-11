#!/bin/bash

#
# You can use this script to test your own input
#  and check it's output.
# For example you can run this script (from this directory) as:
#  $ bash bash_test_cli.sh "my test ! string"
# and
#  $ bash bash_test_cli.sh "my test ! string" --no-space
#

source ../bash_string_escape.sh

escapedval=$(bash_string_escape "$1" "$2")
echo "Escaped: $escapedval"