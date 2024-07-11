#!/bin/bash

# Define a function that takes one argument
my_function() {
    echo "Function argument: $1"
}

# Call the function with an argument
my_function "Hello, World!"

# Access the script's first argument
echo "Script argument: $1"


# So how should we use script argument inside function ?

# 1. Pass the Script Argument as a Function Argument

##!/bin/bash
#
## Define a function that takes one argument
#my_function() {
#    echo "Function argument: $1"
#}
#
## Call the function with the script's first argument
#my_function "$1"
#
## Access the script's first argument
#echo "Script argument: $1"


# 2. Use a Named Variable for the Script Argument
##!/bin/bash
#
## Define a function that takes one argument
#my_function() {
#    echo "Function argument: $1"
#}
#
## Use a named variable for the script's first argument
#script_arg="$1"
#
## Call the function with the named variable
#my_function "$script_arg"
#
## Access the script's first argument
#echo "Script argument: $script_arg"


# 3. Use Global Variables
##!/bin/bash
#
## Define a function that uses a global variable
#my_function() {
#    echo "Function argument: $script_arg"
#}
#
## Set a global variable for the script's first argument
#script_arg="$1"
#
## Call the function
#my_function
#
## Access the script's first argument
#echo "Script argument: $script_arg"
