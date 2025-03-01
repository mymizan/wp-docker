#!/bin/bash

# We need this script inside Docker to sync files changes from the host to the container.
# This way, we can keep using our code editor in the host machine while our dev env is is within Docker.
# We needed to opt for this method due to performance issues in bind mounts when the host is Windows.  
# If you have a Unix host, you can go for bind mounts to simplify the process.
while inotifywait -r -e modify,create,delete,move /source/folder; do
    rsync -av --ignore-existing /source/folder/ /destination/folder/
done
