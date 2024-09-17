#!/bin/bash

# fetch all remote updates
git fetch --prune
# Before fetching, remove any remote-tracking references that no longer exist on the remote

local_branches=$(git branch | sed 's/\*/ /')
# replace asterisk with a space
# for consistency

for branch in $local_branches; do

    # checks if branch NOT present in remote with !
    if ! git branch -r | grep "\sorigin/main$"; then
    git branch -d $branch
    echo "$branch did not exist in remote repo and has been deleted"

    fi
done
    
