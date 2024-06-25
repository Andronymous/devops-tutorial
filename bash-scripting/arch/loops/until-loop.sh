#!/bin/bash

count=1
until [ $count -gt 5 ]
do
 echo "Number: $count"
 ((count++))
done
