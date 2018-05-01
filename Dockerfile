# Build from sources
FROM golang as build
RUN apt-get update; \
	apt-get install -y git; \
	mkdir -p /go/src/github.com/docker

ARG BRANCH=master
RUN cd /go/src/github.com/docker; \
	git clone https://github.com/docker/swarmkit.git -b $BRANCH; \
	cd /go/src/github.com/docker/swarmkit; \
	make binaries
	
RUN cd /go/src/github.com/docker/swarmkit; \
	make setup; \
	make all

# Create docker image
FROM golang
RUN apt-get update; \
	apt-get install -y net-tools sudo
COPY /scripts /scripts
COPY --from=build /go/src/github.com/docker/swarmkit/bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*; \
	chmod a+x /scripts/*