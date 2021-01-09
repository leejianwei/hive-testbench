#!/bin/bash

wget https://repo1.maven.org/maven2/com/facebook/presto/presto-benchmark-driver/0.245.1/presto-benchmark-driver-0.245.1-executable.jar
chmod +x presto-benchmark-driver-0.245.1-executable.jar

./presto-benchmark-driver-0.245.1-executable.jar --server ip-172-31-24-179.us-east-2.compute.internal:8889 --catalog kudu --schema default