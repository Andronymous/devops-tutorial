#!/bin/bash

<<return-poin
Functions in Bash do not return values in the same way functions in other programming languages do.
Instead, they output to the standard output (stdout) or standard error (stderr).
To return a value, you can use the echo command or simply write the value,
and then capture this output when calling the function.
return-poin

function check_number {
 if [ $1 -lt 0 ]; then
    echo "Error: Number must be positive."
    return 1
 fi
 return 0
}

check_number -5
if [ $? -eq 1 ]; then
 echo "The function returned an error."
fi

#------------------

function greet {
 echo "Hello, $1"
}

greeting=$(greet "World")
echo "$greeting"

#------------------

function add {
 echo $(($1 + $2))
}

result=$(add 5 3)
echo "The sum is $result"


