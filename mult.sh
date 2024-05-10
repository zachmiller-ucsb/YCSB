#!/bin/bash

shopt -s extglob

db=$1

for T in 3 5 7 10; do 
    echo "Loading ${db} T=${T}"
    ./load-mult.sh ${db} ${T}
    sleep 2
    echo "Running ${db} T=${T}"
    ./run-mult.sh ${db} ${T}
    rm /ycsb/!(lost+found)
done