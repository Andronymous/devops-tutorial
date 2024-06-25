#!/bin/bash

echo "Are you ok?"
read -p "Are you ok? (Y/N): " response

response=$(echo "$response" | tr '[:upper:]' '[:lower:]')
case "$response" in
    y|yes)
        echo "Great! Let's proceed."
        ;;
    n|no)
        echo "Sorry to hear that. Let's try again later."
        ;;
    *)
        echo "Invalid input. Please answer with Y or N."
        ;;
esac
