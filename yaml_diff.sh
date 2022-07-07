#!/bin/bash

## Usage: find diff of 2 yaml objects
## requirement: yq 4.x and sdiff

usage(){
   echo -e "\nUsage: ./`basename $0` <file1> <file2> \n"
}

file1=${1}
file2=${2}

if [ $# -ne 2 ]; then
  usage
  exit 1
fi

for kind in $(grep -h ^kind $file1 $file2 | sort | uniq | awk '{print $2}'); do 
    sdiff <(yq '. | select(.kind == "'"$kind"'") | sort_keys(..)' $file1)  <(yq '. | select(.kind == "'"$kind"'") | sort_keys(..)' $file2)
    echo ==================================================================
done 
