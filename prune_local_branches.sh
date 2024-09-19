#!/bin/bash

# fetch all remote updates
git fetch --prune
# Before fetching, remove any remote-tracking references that no longer exist on the remote

local_branches=$(git branch | sed 's/\*//')
# removes asterisk
# for consistency

for branch in $local_branches; do

    if [[ "$branch" == "main" ]]; then
        echo "skipping main branch"
        continue
    fi

    # checks if branch NOT present in remote with !
    if ! git branch -r | grep "\s$branch/main$"; then
        git branch -d $branch
        echo "$branch did not exist in remote repo and has now been deleted"
    fi
done
    
