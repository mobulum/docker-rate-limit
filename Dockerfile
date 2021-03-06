# Rate-limit based on github.com/Clever/sphinx
# WEBSITE https://github.com/mobulum/docker-rate-limit
# VERSION 1.0.0


# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang:latest
MAINTAINER Mateusz Stępniak "contact@mobulum.com"

# Copy the local package files to the container's workspace.
ADD example.yaml $GOPATH/example.yaml

RUN go get github.com/Clever/sphinx
RUN go install github.com/Clever/sphinx

ADD start.sh /usr/local/bin/start.sh

ENV CONFIG_FILE_PATH $GOPATH/example.yaml

# Document that the service listens on port 6634.
EXPOSE 6634
EXPOSE 60002

CMD ["/usr/local/bin/start.sh"]
