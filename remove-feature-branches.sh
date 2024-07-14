#!/bin/sh
 
if [ $# -eq 0 ]; then
    echo "Usage with parameters: $0 <branch1> <branch2> ... <branchN>"
    echo "Defaulting to $0 main master develop dev"
 
    PATTERN="main|master|develop|dev"
else 
    PATTERN=$(printf "|%s" "$@")
    PATTERN="${PATTERN:1}"  # remove the leading '|'
fi
 
FILTERED_BRANCHES=$(git branch | grep -ivE "$PATTERN")
 
if [ -n "$FILTERED_BRANCHES" ]; then
    echo "Filtered branches:"
    echo "$FILTERED_BRANCHES"
    git branch | grep -ivE "$PATTERN" | xargs git branch -D
else
    echo "No branches to delete."
fi