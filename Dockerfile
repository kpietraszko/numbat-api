FROM thecatlady/webhook
RUN curl -sSLO https://github.com/sharkdp/numbat/releases/download/v1.15.0/numbat-musl_1.15.0_amd64.deb
RUN apk add dpkg
RUN dpkg --add-architecture amd64
RUN dpkg -i numbat-musl_1.15.0_amd64.deb

COPY hooks.json /config/hooks.json
CMD ["-verbose", "-hotreload", "-hooks=hooks.json"]
