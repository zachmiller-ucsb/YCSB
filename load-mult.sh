#!/bin/bash

db=$1
T=$2

./bin/ycsb load rocksdb -s -P workloads/workloada -p rocksdb.dir=/ycsb -p T=${T} 2> rocksdb/results/${db}_${T}_load_stats.txt > rocksdb/results/${db}_${T}_load.txt
