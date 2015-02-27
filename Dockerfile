FROM ubuntu:latest

USER root


MAINTAINER daniel seybold <daniel.seybold@uni-ulm.de>

RUN export DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list

RUN apt-get update

RUN apt-get -y upgrade

RUN apt-get -y install vim wget curl libssl0.9.8 librtmp0 python

ADD http://packages.couchbase.com/releases/2.2.0/couchbase-server-enterprise_2.2.0_x86_64.deb /home/ubuntu/couchbase-server-enterprise_2.2.0_x86_64.deb

RUN dpkg -i /home/ubuntu/couchbase-server-enterprise_2.2.0_x86_64.deb

ADD start-couchbase.sh /start-couchbase.sh

RUN chmod +x start-couchbase.sh

CMD ["/start-couchbase.sh"]
