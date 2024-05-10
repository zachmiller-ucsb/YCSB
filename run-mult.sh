#!/bin/bash

db=$1
T=$2

for workload in 'c' 'b' 'd' 'e' 'f' 'a';
do
    ./bin/ycsb run rocksdb -s -P workloads/workload${workload} -p rocksdb.dir=/ycsb -p T=${T} 2> rocksdb/results/${db}_${T}_${workload}_stats.txt > rocksdb/results/${db}_${T}_${workload}.txt
    sleep 2
done