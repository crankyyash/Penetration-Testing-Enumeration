#!/bin/bash
for i in $(cat scope.txt)
do
    j=1;
    echo "URL: "$i;
    echo "Count: "$j;
    ((j=j+1))
    host $i | awk '/address/{print $NF}';
    echo -e "\n";
done
