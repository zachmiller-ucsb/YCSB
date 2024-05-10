#!/bin/bash

db=$1
T=$2
c=$3

./bin/ycsb load rocksdb -s -P workloads/workloada -p rocksdb.dir=/ycsb -p c=${c} -p T=${T} 2> rocksdb/results/${db}_load_stats.txt > rocksdb/results/${db}_load.txt
