#!/bin/bash

source ../bash_string_escape.sh

test_input='NoEscape: aA12 a-zA-Z0-9/.:?,;()[]{}<>=*+- | Do escape: ! $'
expected_output='NoEscape:\ aA12\ a-zA-Z0-9/.:?,;()[]{}<>=*+-\ \|\ Do\ escape:\ \!\ \$'
expected_nospace_output='NoEscape: aA12 a-zA-Z0-9/.:?,;()[]{}<>=*+- \| Do escape: \! \$'


#
# [Bash] Default option, DO escape spaces
echo " => TEST: [Bash] Default option, DO escape spaces"

escaped_value=$(bash_string_escape "${test_input}")
run_result=$?

if [ ${run_result} -ne 0 ] ; then
	echo "[!] ERROR: Run failed! (exit code: ${run_result})"
	exit ${run_result}
fi

if [[ "${escaped_value}" == "${expected_output}" ]] ; then
	echo "OK"
else
	echo "[!] ERROR"
	echo "Escaped:"
	echo "-> ${escaped_value}"
	echo "Doesn't match Expected:"
	echo "-> ${expected_output}"
	exit 1
fi


#
# [Ruby] Default option, DO escape spaces
echo " => TEST: [Ruby] Default option, DO escape spaces"

ruby_escaped_val=$(ruby ../_example/ruby_example_cli.rb --input="${test_input}" --disable-input-print=true)
run_result=$?

if [ ${run_result} -ne 0 ] ; then
	echo "[!] ERROR: Run failed! (exit code: ${run_result})"
	exit ${run_result}
fi

if [[ "${ruby_escaped_val}" == "${expected_output}" ]] ; then
	echo "OK"
else
	echo "[!] ERROR"
	echo "Escaped:"
	echo "-> ${ruby_escaped_val}"
	echo "Doesn't match Expected:"
	echo "-> ${expected_output}"
	exit 1
fi


#
# [Bash] --no-space option, DON'T escape spaces
echo " => TEST: [Bash] --no-space option, DON'T escape spaces"

escaped_value=$(bash_string_escape "${test_input}" --no-space)
run_result=$?

if [ ${run_result} -ne 0 ] ; then
	echo "[!] ERROR: Run failed! (exit code: ${run_result})"
	exit ${run_result}
fi

if [[ "${escaped_value}" == "${expected_nospace_output}" ]] ; then
	echo "OK"
else
	echo "[!] ERROR"
	echo "Escaped:"
	echo "-> ${escaped_value}"
	echo "Doesn't match Expected:"
	echo "-> ${expected_nospace_output}"
	exit 1
fi

#
# [Ruby] DON'T escape spaces option
echo " => TEST: [Ruby] DON'T escape spaces option"

ruby_escaped_val=$(ruby ../_example/ruby_example_cli.rb --input="${test_input}" --is-escape-space=false --disable-input-print=true)
run_result=$?

if [ ${run_result} -ne 0 ] ; then
	echo "[!] ERROR: Run failed! (exit code: ${run_result})"
	exit ${run_result}
fi

if [[ "${ruby_escaped_val}" == "${expected_nospace_output}" ]] ; then
	echo "OK"
else
	echo "[!] ERROR"
	echo "Escaped:"
	echo "-> ${ruby_escaped_val}"
	echo "Doesn't match Expected:"
	echo "-> ${expected_nospace_output}"
	exit 1
fi

echo
echo "--- ALL OK ---"
echo
