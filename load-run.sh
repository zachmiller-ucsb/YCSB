#!/bin/bash

shopt -s extglob

T=5

for i in '0'; do
    mkdir -p ./rocksdb/results${i}
    for c in 'rocks'; 
    do
        # clear the os cache
        sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'
        sleep 2

        ./bin/ycsb load rocksdb -s -P workloads/workloada -p rocksdb.dir=/ycsb -p T=${T} 2> rocksdb/results${i}/${c}_load_stats.txt > rocksdb/results${i}/${c}_load.txt
        # ./bin/ycsb load rocksdb -s -P workloads/workloada -p rocksdb.dir=/ycsb -p c=${c} -p T=${T} 2> rocksdb/results${i}/${c}_load_stats.txt > rocksdb/results${i}/${c}_load.txt
        sleep 2
        for workload in 'c' 'b' 'd' 'e' 'f' 'a'; 
        do
            # clear the os cache
            sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'
            sleep 2

            # I'll run workload c once before each workload to ensure no compactions lingering
            ./bin/ycsb run rocksdb -s -P workloads/workload${workload} -p rocksdb.dir=/ycsb -p T=${T}
            # ./bin/ycsb run rocksdb -s -P workloads/workloadc -p rocksdb.dir=/ycsb -p c=${c} -p T=${T} 

            ./bin/ycsb run rocksdb -s -P workloads/workload${workload} -p rocksdb.dir=/ycsb -p T=${T} 2> rocksdb/results${i}/${c}_${workload}_stats.txt > rocksdb/results${i}/${c}_${workload}.txt
            # ./bin/ycsb run rocksdb -s -P workloads/workload${workload} -p rocksdb.dir=/ycsb -p c=${c} -p T=${T} 2> rocksdb/results${i}/${c}_${workload}_stats.txt > rocksdb/results${i}/${c}_${workload}.txt
            sleep 2
        done 
        sudo rm /ycsb/!(lost+found)
    done
done