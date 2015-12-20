#!/bin/bash

set -e

docker_build="sudo docker build -t"

buildJustOne(){
    name="$1"
    dockerfile_path="$2"
    $docker_build $image_name $dockerfile_path
}

buildThemAll(){
    #delete all images manually first
    root_path="$1"
    buildEditors $root_path
    buildTestSuite $root_path
    buildSailsbox $root_path
    if [["$2" == --include-data-volume]]; then
        buildDatavolbox $root_path
    fi
}

buildEditors(){
    root_path="$1"
    buildDevbox $root_path
    buildPairbox $root_path
}

buildTestSuite(){
    root_path="$1"
    buildUnitbox $root_path
    buildAcceptancebox $root_path
}

buildNodebox(){
    cd "$1"/node/
    buildJustOne nodebox .
}

buildUnitbox(){
    cd "$1"/node/jasmine-node/
    buildJustOne unitbox .
}

buildAcceptancebox(){
    cd "$1"/node/cucumber/
    buildJustOne acceptancebox .
}

buildDevbox(){
    cd "$1"/editor/
    buildJustOne devbox .
}

buildPairbox(){
    cd "$1"/pair/
    buildJustOne pairbox .
}

buildSailsbox(){
    cd "$1"/sails/
    buildJustOne sailsbox .
}

buildDatavolbox(){
    #I need to decide where datavol will be.
    cd "$1"/datavol/
    buildJustOne datavol .
}

"$@"
