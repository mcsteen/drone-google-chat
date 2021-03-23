FROM alpine:latest

RUN apk add --update --no-cache \
    curl \
    ca-certificates \
    bash

COPY drone-google-chat.sh /bin/

ENTRYPOINT ["/bin/bash"]

CMD ["/bin/drone-google-chat.sh"]
