#!/bin/bash

set -e 

dockerrun="sudo docker run --name"
dockersockandbin="-v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/bin/docker"
dockerlinktest="--link unitbox:unitbox"
dockervolumes="--volumes-from datavol"

alone(){
    name="${1:-devbox}"
    $dockerrun $name --rm -it $dockersockandbin $dockerlinktest $dockervolumes devbox tmux -2
}

pair(){
    name="${1:-pairbox}"
    users="`join , ${@:2}`"
    pairs="-e AUTHORIZED_GH_USERS=$users -p 0.0.0.0:8109:22"
    $dockerrun $name -dt $dockersockandbin $dockerlinktest $dockervolumes $pairs pairbox  
}    

join(){
    local IFS="$1"
    shift
    echo "$*"
}

unit(){
    name="${1:-unitbox}"
    $dockerrun $name -dt $dockervolumes unitbox sh
}

acceptance(){
    #cucumber container
}

justMe(){
    unit
    acceptance
    alone
}

weAll(){
    pair pairbox #users
    unit
    acceptance
}

#testar se $@ tem algo, se não tiver chamar o main, se tiver chamar o $@
"$@"

