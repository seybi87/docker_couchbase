#!/bin/bash


/etc/init.d/couchbase-server start

sleep 10;

pid_file=/opt/couchbase/var/lib/couchbase/couchbase-server.pid
# can't use 'wait $(<"$pid_file")' as process not child of shell
while [ -e /proc/$(<"$pid_file") ]; 
do 
#	echo "run run run";
	sleep 1; 
done
