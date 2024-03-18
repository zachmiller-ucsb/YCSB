#!/bin/bash

db=$1

./bin/ycsb load rocksdb -s -P workloads/workloada -p rocksdb.dir=/ycsb 2> rocksdb/results/${db}_load_stats.txt > rocksdb/results/${db}_load.txt
