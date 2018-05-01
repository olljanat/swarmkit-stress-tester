FROM golang
RUN apt-get update; \
	apt-get install -y git net-tools sudo; \
	mkdir -p /go/src/github.com/docker

ARG BRANCH=master
RUN cd /go/src/github.com/docker; \
	git clone https://github.com/docker/swarmkit.git -b $BRANCH

WORKDIR /go/src/github.com/docker/swarmkit
RUN make binaries; \
	make setup

COPY /scripts /scripts
COPY /go/src/github.com/docker/swarmkit/bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*; \
	chmod a+x /scripts/*
