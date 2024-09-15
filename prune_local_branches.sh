#!/bin/bash

# fetch all remote updates
git fetch --prune
# Before fetching, remove any remote-tracking references that no longer exist on the remote

local_branches=$(git branch | sed 's/\*/ /')
# get rid of the asterisk marking which branch is checked out


for branch in local_branches; do

    
