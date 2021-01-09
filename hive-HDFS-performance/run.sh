#!/bin/bash

for query in `ls sql/*`
do
	echo "Test Query: " ${query}
    time `hive -f ${query} > hive-test.result`
done
