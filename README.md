steps-utils-bash-string-escaper
===============================

Escapes a given input string so any "special" character will be escaped with \

Useful for escaping another program's input _as a string_ or for
saving the input content as a value in an environment profile file
like ~/.bash_profile or ~/.bashrc

*The value is meant to be included in quotation marks, the way it's used in the included examples.*


## Examples

The string:

    This is a "special" string with 'things' like $this

Will become (with default option):

    This\ is\ a\ \"special\"\ string\ with\ \'things\'\ like\ \$this

or with `"--no-space"` option:

    This is a \"special\" string with \'things\' like \$this

You can find examples of how to use these scripts
in the **_example** folder, and the automatic tests
in the **_test** folder.
