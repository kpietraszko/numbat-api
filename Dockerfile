ARG NUMBAT_DEB_FILE_NAME="numbat-musl_1.15.0_amd64.deb"

FROM thecatlady/webhook
RUN curl -sSLO https://github.com/sharkdp/numbat/releases/download/v1.15.0/${NUMBAT_DEB_FILE_NAME}
RUN apk add --no-cache dpkg && \
  dpkg --add-architecture amd64 && \
  dpkg -i ${NUMBAT_DEB_FILE_NAME} && \
  rm ${NUMBAT_DEB_FILE_NAME}

COPY hooks.json /config/hooks.json
CMD ["-verbose", "-hotreload", "-hooks=hooks.json"]
