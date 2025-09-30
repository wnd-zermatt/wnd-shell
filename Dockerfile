FROM ubuntu:24.04

ENV HOME=/home/wnd-admin
ARG USER_ID=1000

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        python3 python3-pip python3-venv build-essential \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bookworm stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends docker-ce-cli

RUN userdel -r ubuntu || true
RUN useradd -u ${USER_ID} -m -s /bin/bash wnd-admin \
  && echo "wnd-admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR $HOME
USER wnd-admin

RUN python3 -m venv ~./python-venv
ENV PATH="~./python-venv/bin:$PATH"
RUN pip install --no-cache-dir --upgrade pip==24.0 \
      molecule==25.7.0 \
      ansible==11.9.0 \
      pytest \ 
      testinfra \
      molecule-plugins[docker]==25.8.12

HEALTHCHECK CMD [ "ls", "/" ]
