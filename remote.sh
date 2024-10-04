#!/bin/sh

remote() {
    # @description remove all git branches no longer tracked on remote
    # @param $1 flags passed to `git branch` when deleting the branches that couldn't be found on remote (-d is not implicit, you must explicitly pass it)
    git fetch origin --prune

    remote_branches=$(git branch -r | awk '{ if ($1 == "*") print $2; else print $1; };' | awk -F/ '{$1=""; print $0;};' | sed 's/^ //g' | sed 's/ /\//g')
    branches_to_delete=$(git branch | grep -E -v "$remote_branches")

    if [ x"$branches_to_delete" = x ] ; then 
        echo "No branches to delete! :)"
        return 0
    fi

    echo "$branches_to_delete" | awk '{print $0;};' | xargs git branch $(echo "$1")

    return 0
}