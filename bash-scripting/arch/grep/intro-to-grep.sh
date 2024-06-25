#!/bin/bash

# Most Useful grep Flags
# -r (Recursive Search): This flag allows grep to search through the specified directory and its subdirectories recursively. It's useful when you need to find a pattern across multiple files in a directory tree. For example, to search for the string "securityagent" in the /etc directory and all its subdirectories, you would use:
# This command is particularly useful for system administrators who need to search through large directory structures
grep -r securityagent /etc

# -i (Case Insensitive Search): By default, grep is case-sensitive. The -i flag makes the search case-insensitive, which can be helpful when you're not sure about the case of the text you're searching for. For example, to search for "error" in a case-insensitive manner, you would use:
# This is useful in scenarios where the case of the text might vary.
grep -i error filename.txt

# -l (Lowercase L): This flag tells grep to only output the names of files with matching lines, rather than the matching lines themselves. It's useful when you're interested in knowing which files contain the pattern but not the actual lines that match. For example:
# This command lists all files in the current directory that contain the specified pattern.
grep -l pattern *

# -v (Invert Match): The -v flag inverts the search, meaning it will show lines that do not match the specified pattern. This is useful when you want to exclude certain lines or patterns from the output. For example, to exclude lines containing "error" from the output, you would use:
# This flag is often used in combination with other flags for more complex searches.
grep -v error filename.txt

# -I (Capital I): This flag tells grep to ignore binary files. By default, grep will process binary files as if they were text files, which can lead to errors or unexpected results. The -I flag prevents grep from processing binary files, making it safer to use with a wide range of files. For example:
# This command searches for the pattern in all files in the current directory, excluding binary files.
grep -I pattern *


grep -E "[0-9]{3}-[0-9]{4}"


