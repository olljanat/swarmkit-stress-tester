FROM golang
RUN apt-get update; \
	apt-get install -y git net-tools sudo; \
	mkdir -p /go/src/github.com/docker

ARG BRANCH=master
ARG GITHUBACCOUNT=docker
RUN cd /go/src/github.com/docker; \
	git clone https://github.com/$GITHUBACCOUNT/swarmkit.git -b $BRANCH

WORKDIR /go/src/github.com/docker/swarmkit
RUN make binaries; \
	make setup; \
	cp /go/src/github.com/docker/swarmkit/bin/* /usr/local/bin/; \
	chmod a+x /usr/local/bin/*

COPY /scripts /scripts
RUN chmod a+x /scripts/*
WORKDIR /

