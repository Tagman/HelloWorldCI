#!/bin/bash


IT="-it"

if [ $# -gt 0 ]
    then

        key="$1"

        case $key in
            -i|--interactive)
            ;;

            -b|--build)
            CMD=(/bin/bash -c 'cd /home/dev/src/build && cmake .. && make')
            echo "${CMD[@]}"
            IT=""
            ;;

        esac
        
fi


docker run --rm --name testBuild $IT -v "$(pwd)":/home/dev/src build:latest "${CMD[@]}"