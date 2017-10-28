FROM <your-docker-repository>/php-fpm:7.1

RUN apt-get update && \
    apt-get -y install git

RUN apt-get clean

COPY rootfs /

ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["--help"]