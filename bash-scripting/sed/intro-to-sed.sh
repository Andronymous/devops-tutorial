#!/bin/bash
# SED
#################################
## Most Commonly Used commands ##
#################################

# 1. Substitution (s): This is the most common use of sed. It replaces a pattern with a replacement string.
sed 's/pattern/replacement/g' filename

# Example:
sed 's/Orange/Kiwi/g' example-01.txt

# Explanation: This command replaces all occurrences of "Orange" with "Kiwi" in the example-01.txt file. The g flag ensures all matches are replaced.



# 2. Deletion (d): Removes lines matching a pattern:
sed '/pattern/d' filename

#Example:
sed '/Banana/d' example-02.txt

# Explanation: This command deletes any line containing "Banana" from the fruits.txt file.



# 3. Printing (p): Selectively prints lines:
sed '/pattern/p' filename  # Print lines with pattern
sed '10p' filename         # Print the 10th line
sed '10,20p' filename      # Print lines 10 to 20 (inclusive)

# Example:
sed '2,4p' example-03.txt

# Explanation: This command prints only lines 2 (Banana) and 4 (Mango) from the fruits.txt file. You can adjust the range (e.g., 1,3p for lines 1 to 3).



# 4. Appending (a\text): Adds a line of text after matching lines:
sed '/pattern/a\text to append' filename

Example:
sed '/g/a\Pineapple' fruits.txt
# Explanation: This command appends the line "Pineapple" after every line containing the letter "g" (Orange and Mango).



# 5. Inserting (i\text): Inserts a line of text before matching lines:
sed '/pattern/i\text to insert' filename

Example:
sed '/^M/i\Strawberry' fruits.txt
# Explanation: This command inserts the line "Strawberry" before any line where the fruit name starts with an uppercase "M" (Mango). The ^ symbol matches the beginning of the line

