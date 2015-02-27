#!/bin/sh

#21100
portRangeStart=21100;
#21300
portRangeEnd=21300;

portlist="-p 11210:11210 -p 8091:8091 -p 8092:8092 -p 4369:4369 -p 11209:11209 ";

while [ $portRangeStart -lt $portRangeEnd ];
do 

portlist="$portlist -p $portRangeStart:$portRangeStart";

portRangeStart=$((portRangeStart+1));
done


#echo $portlist

docker run -d -v --net=host $portlist dseybold/docker-couchbase