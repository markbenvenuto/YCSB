#!/bin/bash

THREADS=16
REPO=/home/mark/mongo

function run_load {

    echo "============================================="
    echo "THREADS $THREADS, FLE $FLE"

$REPO/mongo --eval "db.getSiblingDB('ycsb').dropDatabase()";

# JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.3.7-5.fc30.x86_64
# JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.3.7-5.fc30.x86_64

PATH=$REPO:$PATH   ./bin/ycsb load mongodb  -P workloads/workloada -p mongodb.fle=$FLE -threads $THREADS
PATH=$REPO:$PATH   ./bin/ycsb run mongodb  -P workloads/workloada -p mongodb.fle=$FLE -threads $THREADS

}

# FLE=false
# run_load

THREADS=8
FLE=true
run_load



# THREADS=8
# FLE=true
# run_load
