FROM alpine:3.17.0

ARG DUMB_INIT
ARG BUILD_DATE

LABEL maintainer="lomv0209@gmail.com" \
      owner="JustMe" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/Lucho00Cuba/py-squid.git"

ENV SQUID_LISTEN_PORT=${SQUID_LISTEN_PORT:-3128}

# ------ https://github.com/Yelp/dumb-init ------
ENV DUMB_INIT_VERSION=${DUMB_INIT:-1.2.0}
ADD https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 /bin/dumb-init
# -----------------------------------------------

RUN apk add --update --no-cache squid python3 

ADD extras/py-squid.py /bin/

RUN rm -rf /var/cache/apk/* && \
    mkdir -p /etc/squid/ && \
    chown squid:squid -R /etc/squid && \
    chmod 750 /etc/squid && \
    chmod +x /bin/dumb-init && \
    chmod +x /bin/py-squid.py

EXPOSE ${SQUID_LISTEN_PORT}

USER squid
ENTRYPOINT ["/bin/dumb-init"]
CMD ["/bin/py-squid.py"]
