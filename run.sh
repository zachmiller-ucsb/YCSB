#!/bin/bash

db=$1

for workload in 'c' 'b' 'd' 'e' 'f' 'a';
do
    ./bin/ycsb run rocksdb -s -P workloads/workload${workload} -p rocksdb.dir=/ycsb 2> rocksdb/results/${db}_${workload}_stats.txt > rocksdb/results/${db}_${workload}.txt
    sleep 2
done