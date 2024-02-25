#!/bin/bash

# Tests might fail because of non-guaranteed keys ordering, but for now I'll ignore that.

do_test () {
    result="$( curl "http://localhost:8080${querystr}" )"
    if test "$result" != "$expected" ; then
        echo "Failed (${querystr}): ${result} != ${expected}" 1>&2
        exit 1
    else
        echo "Ok (${querystr})"
    fi
}


# Adds param to empty querystr
querystr="" expected='{"key": "mysupersecretkey"}' do_test

# Adds param to non-empty querystr
querystr="?some=thing" expected='{"some": "thing", "key": "mysupersecretkey"}' do_test

# Replace only if key param is not querystr
querystr="?some=thing&key=mykeyvalue" expected='{"some": "thing", "key": "mykeyvalue"}' do_test

# Correctly matches key param
querystr="?some=thing&mykey=mykeyvalue" \
expected='{"some": "thing", "mykey": "mykeyvalue", "key": "mysupersecretkey"}' \
do_test
