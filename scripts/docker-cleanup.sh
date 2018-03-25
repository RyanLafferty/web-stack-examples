#!/bin/bash

# remove unused docker volumes
docker volume ls -qf dangling=true | xargs docker volume rm

# remove unused docker images - this will generate an error if there are no images to remove
docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc )
