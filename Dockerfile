FROM --platform=linux/amd64 wiorca/docker-windscribe

RUN apt-get update \
    && apt-get -qqq install -y \
    privoxy curl  \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

COPY privoxy.cfg /etc/privoxy/config
COPY app-setup.sh /opt/scripts/app-setup.sh
COPY app-startup.sh /opt/scripts/app-startup.sh

EXPOSE 8118