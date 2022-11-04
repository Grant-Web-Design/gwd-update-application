FROM alpine:latest

# ARGS
ARG GWD_HOSTING_SERVER_ADDRESS
ARG GWD_HOSTING_SERVER_KEY

RUN apk --update add --no-cache openssh-client coreutils bash

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]