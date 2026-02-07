ARG BUILD_FROM=ghcr.io/hassio-addons/base:19.0.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        nginx \
        php82-fpm \
        php82-xml \
        php82-session \
        php82 \
    \
    && rm -r -f /etc/nginx \
    && mkdir /dokuwiki \
    && curl -L -s \
        "https://download.dokuwiki.org/src/dokuwiki/dokuwiki-2025-05-14b.tgz" \
        | tar zxvf - --strip 1 -C /dokuwiki
    
# Copy root filesystem
COPY rootfs /

RUN \
    chmod -R 777 /dokuwiki \
    && chmod -R 777 /etc/services.d/ \
    && chmod 777 /etc/cont-init.d/dokuwiki.sh

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Thomas Williamson <iceonly@gmail.com>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="IceOnly" \
    org.opencontainers.image.authors="Thomas Williamson <iceonly@gmail.com>" \
    org.opencontainers.image.licenses="GPL2" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
