FROM alpine:3.20.1 AS prepare
ARG NUMBAT_VERSION="1.15.0"
ARG NUMBAT_DEB_FILE_NAME="numbat-musl_${NUMBAT_VERSION}_amd64.deb"

RUN apk add --no-cache curl dpkg && \
    dpkg --add-architecture amd64

RUN curl -sSLO https://github.com/sharkdp/numbat/releases/download/v${NUMBAT_VERSION}/${NUMBAT_DEB_FILE_NAME}
RUN dpkg -i ${NUMBAT_DEB_FILE_NAME} && \
  rm ${NUMBAT_DEB_FILE_NAME}

# RUN ldd /usr/bin/numbat  
# ^ outputs only /lib/ld-musl-x86_64.so.1, which means numbat doesn't link dynamically to any libraries

FROM thecatlady/webhook
COPY --from=prepare /usr/bin/numbat /usr/bin/numbat
COPY hooks.json /config/hooks.json
CMD ["-urlprefix", "test", "-verbose", "-hotreload", "-hooks=hooks.json"]
