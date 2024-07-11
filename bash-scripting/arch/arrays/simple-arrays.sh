#!/bin/bash

#array_name=(value1 value2 value3 ...)
files=("f1.txt" "f2.txt" "f3.txt" "f4.txt" "f5.txt")

echo ${files[0]} # certain index
echo ${files[@]} # all indexes
echo ${#files[@]} # length
echo ${!files[@]} # number of indexes (keys from associative array)

for file in "${files[@]}"; do
 echo "$file"
done

for key in "${!files[@]}"; do
 echo "$key : ${files[$key]}"
done
