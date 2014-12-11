#!/bin/bash

#
# It's a simple example of how you can use the
#  bash escaper in your own bash script
#

source ../bash_string_escape.sh

an_example_input="This is my example,
with some special chars to escape: ! $ | ' \" "

escapedval=$(bash_string_escape "${an_example_input}")
echo
echo "-> Escaped: $escapedval"

escapedval=$(bash_string_escape "${an_example_input}" --no-space)
echo
echo "-> Escaped with --no-space option: $escapedval"