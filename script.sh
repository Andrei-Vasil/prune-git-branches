#!/bin/sh

flag="-d";

# read_input_flags
while test $# -gt 0; do
	case "$1" in
       	-f*)
			flag="-D";
           	shift;
            ;;
   	    *)
			echo "Invalid flag given: $1"
            exit 1;
            ;;
   	esac
done

in_git_folder=`git rev-parse --is-inside-work-tree 2> /dev/null`
[[ -z "$in_git_folder" ]] && echo "You are not located in a git repository! :(" && exit 0;
git fetch origin --prune
remote_branches=`git branch -r | awk '{ if ($1 == "*") print $2; else print $1; };' | awk -F/ '{$1=""; print $0;};' | sed 's/^ //g' | sed 's/ /\//g'`
branches_to_delete=`git branch | grep -E -v "$remote_branches"`;
[[ -z "$branches_to_delete" ]] && echo "No branches to delete! :)" && exit 0;
echo $branches_to_delete | awk '{print $0;};' | xargs git branch `echo $flag;`
