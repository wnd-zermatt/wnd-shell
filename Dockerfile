FROM ubuntu:24.04

ENV HOME=/home/wnd-admin
ARG USER_ID=1000

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bookworm stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends docker-ce-cli

RUN userdel -r ubuntu || true
RUN useradd -u ${USER_ID} -m -s /bin/bash wnd-admin \
  && echo "wnd-admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


HEALTHCHECK CMD [ "ls", "/" ]

USER ${USER_ID}
