FROM <your-docker-repository>/alpine:3.3

RUN apk update && apk upgrade && \
apk add --no-cache bash git openssh

COPY rootfs /

ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["--help"]