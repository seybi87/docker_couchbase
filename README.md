# Docker for Couchbase 2.2 

This docker image is set up for running Couchbase 2.2 on a VM on Openstack (or other Cloud stacks)
This project was partly inspired by [ncolomer/couchbase](https://registry.hub.docker.com/u/ncolomer/couchbase/).

## Prerequisites

You need to override memlock and nofile limits to make Couchbase run correctly. 
Add the following lines at the end of the `/etc/init/docker.conf` file:

	limit memlock unlimited unlimited
	limit nofile 262144

Finally, restart the Docker daemon: sudo service docker.io restart

## Start a Couchbase Node with all client ports exposed

	docker run -d -p 8091:8091 -p 8092:8092 -p 11209:11209 -p 11210:11210 -p 11207:11207 -p 11211:11211 -p 18091:18091 -p 18092:18092 --net=host dseybold/docker-couchbase

**Important:** --net=host otherwise a Client will throw no route to host exception because the docker 
internal ip is returned to client.
Maybe there is a better solution than --net=host.

## Start a Couchbase Node exposing all ports for building a cluster across different VMs
use the source repo script docker_couchbase_start.sh

	./docker_couchbase_start.sh