steps-utils-bash-string-escaper
===============================

Escapes a given input string so any "special" character will be escaped with \

For example the string:
This is a "special" string with 'things' like $this

Will become (with default option)
This\ is\ a\ \"special\"\ string\ with\ \'things\'\ like\ \$this

or will become (with "--no-space" option)
This is a \"special\" string with \'things\' like \$this

You can find an example of how to use the bash_string_escape.sh script.