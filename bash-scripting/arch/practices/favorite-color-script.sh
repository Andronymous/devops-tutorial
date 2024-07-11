#!/bin/bash

echo "Enter your favorite color:"
read color

color=$(echo "$color" | tr '[:upper:]' '[:lower:]')

case "$color" in
    red|green|blue)
        echo "You chose a primary color."
        ;;
    yellow|orange|purple)
        echo "You chose a secondary color."
        ;;
    *)
        echo "Invalid color entered."
        exit 1
        ;;
esac