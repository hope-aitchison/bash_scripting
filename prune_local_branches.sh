#!/bin/bash

# fetch all remote updates
git fetch --prune
# Before fetching, remove any remote-tracking references that no longer exist on the remote

local_branches=$(git branch | sed 's/\*//')
# removes asterisk
# for consistency

current_branch=$(git branch --show-current)

for branch in $local_branches; do

    # prevents main or working branch from being deleted
    if [[ "$branch" == "main" || "$branch" == "$current_branch" ]]; then
        echo "skipping $branch (local main or current working branch)"
        continue # move to next iteration
    fi

    # checks if branch NOT present in remote with !
    if ! git branch -r | grep -q "origin/$branch$"; then
        git branch -d $branch
        echo "$branch did not exist in remote repo and has now been deleted"
    fi
done
    
