#!/bin/bash

db=$1
T=$2
c=$3

for workload in 'c' 'b' 'd' 'e' 'f' 'a';
do
    ./bin/ycsb run rocksdb -s -P workloads/workload${workload} -p rocksdb.dir=/ycsb  -p c=${c} -p T=${T} 2> rocksdb/results/${db}_${workload}_stats.txt > rocksdb/results/${db}_${workload}.txt
    sleep 2
done