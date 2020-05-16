FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    TZ=Asia/Kolkata \
    DEBUG_DEPS="curl less lsof strace netcat net-tools" \
    BUILD_DEPS="build-essential" \
    APP_DEPS="nodejs tzdata" \
    NODE_ENV=production \
    APP_USER=appuser

WORKDIR /app

RUN set -ex \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && groupadd --system ${APP_USER} \
    && useradd --no-log-init --system --create-home --gid ${APP_USER} ${APP_USER} \
    && usermod -u 1000 ${APP_USER} \
    && groupmod -g 1000 ${APP_USER} \
    && chown -Rv ${APP_USER}:${APP_USER} /app \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get update && apt-get install -y --no-install-recommends ${BUILD_DEPS} ${APP_DEPS} ${DEBUG_DEPS} \
    && rm -rf /usr/share/doc && rm -rf /usr/share/man \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false ${BUILD_DEPS} \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

USER ${APP_USER}
ENTRYPOINT [ "node", "--init", "-m", "300M", "--memory-swap", "1G" ]
