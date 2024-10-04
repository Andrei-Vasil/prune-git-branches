#!/bin/sh

remote() {
    git fetch origin --prune

    remote_branches=$(git branch -r | awk '{ if ($1 == "*") print $2; else print $1; };' | awk -F/ '{$1=""; print $0;};' | sed 's/^ //g' | sed 's/ /\//g')
    branches_to_delete=$(git branch | grep -E -v "$remote_branches")

    if [ -z "$branches_to_delete" ] ; then 
        echo "No branches to delete! :)"
        return 0
    fi

    echo $branches_to_delete | awk '{print $0;};' | xargs git branch $(echo "$flag")

    return 0
}