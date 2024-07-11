#!/bin/bash

echo "Are you ok?"
read -p "Are you ok? (Y/N): " response

case "$response" in
    [Yy]*|[Yy][Ee][Ss]*|[Yy])
        echo "Great! Let's proceed."
        ;;
    [Nn]*|[Nn][Oo]*|[Nn])
        echo "Sorry to hear that. Let's try again later."
        ;;
    *)
        echo "Invalid input. Please answer with Y or N."
        ;;
esac
