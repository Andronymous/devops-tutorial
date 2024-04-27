#!/bin/bash
# AWK
#################################
## Most Commonly Used commands ##
#################################

# 1. Printing Lines: To print all lines from a file, you can use this command. This is the most basic use of AWK,
# where it reads each line of the file and prints it.
awk '{print}' filename
# example-01:
awk '{print}' example-01.txt


# 2. Printing Specific Fields: To print specific fields from a file, you can use this command.
# This command prints the first and third fields of each line.
awk '{print $1, $3}' filename
# example-02:
awk -F, '{print $1, $3}' example-02.txt


# 3. Using Field Separators: By default, AWK uses whitespace as a field separator.
# However, you can specify a different separator using the -F option, like this to use a colon as a separator.
awk -F ':' '{print $1}' filename
# example-03:
awk -F ':' '{print $1}' example-03.txt


# 4. Conditional Printing: To print lines that match a specific condition, you can use this.
# This command prints lines where the first field equals "value".
awk '$1 == "value"' filename
# example-04:
awk '$1 == "BMW"' example-04.txt
#awk '{if ($1 == "BMW") print $0}' example-04.txt


# 5. Summing Numbers: To sum numbers in a specific column, you can use this command.
# This command adds up all the numbers in the first column and prints the total.
awk '{sum += $1} END {print sum}' filename
# example-05:
awk -F, '{sum += $2} END {print sum}' example-05.txt


# 6. Counting Lines: To count the number of lines in a file, you can use this command.
# This command prints the total number of lines in the file.
awk 'END {print NR}' filename
# example-06:
awk 'END {print NR}' example-06.txt
# -----------------------------------------------------------------------------------------------------------------------
# In AWK, the END block is used to specify actions that should be performed after all input lines have been processed.
# This is particularly useful for operations that require a summary or a final calculation based on the entire dataset,
# rather than on individual lines.

# Use Case of END
# 1. Summarizing Data: When you need to calculate a total, average, or other summary statistics across all lines of input.
# For example, summing numbers in a column, calculating averages, or counting occurrences.

# 2. Final Processing: Performing any final processing or cleanup tasks that depend on the entire dataset.
# This could include sorting, filtering, or formatting the output based on the results of the processing.

# 3. Reporting: Generating reports or summaries that require a final pass over the data.
# For instance, printing a report footer or a summary line after processing all lines.
# -----------------------------------------------------------------------------------------------------------------------

# 7. Finding Unique Values: To find unique values in a specific column, you can use this.
# This command prints all unique values in the first column.
awk '{a[$1]++} END {for (i in a) print i}' filename
# example-07:
awk '{a[$1]++} END {for (i in a) print i}' example-07.txt


#8. Replacing Text: To replace text in a file, you can use this.
# This command replaces all occurrences of "old" with "new" in each line.
awk '{gsub(/old/, "new")} 1' filename
# example-08:
awk -F, '{gsub(/Sweet/, "Tasty"); print $0}' example-08.txt
#echo "$a" > example-08.txt

# 9. Calculating Averages: To calculate the average of numbers in a column, you can use this command.
#This command calculates the average of the numbers in the first column.
awk '{sum += $1; count++} END {print sum/count}' filename
# example-09:
awk -F, '{sum += $2; count++} END {print sum/count}' example-09.txt


# 10. Sorting Data: To sort data based on a specific column, you can use this.
# This command sorts the data based on the first two columns.
awk '{print $1, $2}' filename | sort
# example-10:
awk -F: '{print $1, $2}' example-10.txt | sort


#############################
## Some built-in functions ##
#############################
# 11. index(str1, str2): Searches for the first occurrence of str2 in str1 and returns its position.
awk 'BEGIN{print index("Graphic", "ph"); print index("University", "abc")}' filename
# example-11:
awk 'BEGIN{print index("Toyota", "Toy"); print index("Ford", "rd"); print index("BMW", "M"); print index("Audi", "i");}' example-11.txt
# -----------------------------------------------------------------------------------------------------------------------
# The BEGIN block in AWK is used to specify actions that should be performed before any input lines are read.
#  This is particularly useful for initializing variables, performing calculations that are needed before processing the input data,
#  or setting up conditions that apply to the entire script.
#
#  Use Cases of BEGIN
#  1. Initializing Variables: Before processing the input data, you might need to initialize variables to specific values.
#  The BEGIN block allows you to do this before any input lines are read.
#  2. Pre-processing: If your script requires some pre-processing steps that are independent of the input data,
#  such as reading configuration files or performing calculations that are needed for the entire script, the BEGIN block is the place to do it.
#
#  3. Setting Up Conditions: If your script needs to apply certain conditions to all input lines,
#  you can set these conditions in the BEGIN block. This is useful for defining global variables or conditions that are
#  checked against each input line.
#
#  4. Printing Headers or Initial Information: If your script is generating a report or output that includes headers or
#  initial information, the BEGIN block can be used to print this information before processing the input data.
# -----------------------------------------------------------------------------------------------------------------------


# 12. length(string): Calculates the length of a string.
awk 'BEGIN{print length("Graphic Era University")}' filename
# example-12:
awk '{print length($1)}' example-12.txt


# 13. substr(s, p, n): Extracts a substring from string s starting at position p up to a maximum length of n.
awk 'BEGIN{print substr("Graphic Era University", 9)}' filename
awk 'BEGIN{print substr("Graphic Era University", 9, 8)}' filename
# example-13:
awk -F: '{print substr($1, 1, 3)}' example-13.txt


# 14. tolower(s): Converts all uppercase characters in string s to lowercase.
awk 'BEGIN{print tolower("HELLO WORLD")}' filename
# example-14:
awk '{print tolower($1)}' example-14.txt

# and also toupper
