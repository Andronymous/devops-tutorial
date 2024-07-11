#!/bin/bash

if [ $# -lt 3 ]; then
    echo "Usage: $0 <num1> <num2> <operator>"
    exit 1
fi

num1=$1
num2=$2
operator=$3

case $operator in
    +) result=$((num1 + num2)); operation="addition" ;;
    -) result=$((num1 - num2)); operation="subtraction" ;;
    *) result=$((num1 * num2)); operation="multiplication" ;;
    /)
        if [ $num2 -eq 0 ]; then
            echo "Error: Division by zero is not allowed."
            exit 1
        fi
        result=$((num1 / num2))
        operation="division"
        ;;
    *)
        echo "Invalid operator: $operator"
        exit 1
        ;;
esac

echo "Performing $operation: $num1 $operator $num2 = $result"
