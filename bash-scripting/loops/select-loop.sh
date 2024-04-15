#!/bin/bash

PS3='Please select your favorite fruit: '
select fruit in Apple Banana Cherry
do
 echo "You selected $fruit"
 break
done

