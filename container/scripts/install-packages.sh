#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
export GLAB_VERSION=1.74.0

# Install OS packages, node, podman CLI and npm tools.
apt-get update

apt-get install -y --no-install-recommends \
  ca-certificates \
  curl less wget \
  gnupg \
  neovim \
  ldap-utils \
  git git-lfs \
  dnsutils mtr iputils-ping ncat \
  podman slirp4netns fuse-overlayfs uidmap \
  freeradius-utils eapoltest \
  shellcheck shfmt \
  bash-completion \
  ssh \
  sudo \
  lsb-release \
  python3 python3-pip python3-venv build-essential

## Install GitLab CLI (glab)
curl -fsSL -o /tmp/glab.deb "https://gitlab.com/gitlab-org/cli/-/releases/v${GLAB_VERSION}/downloads/glab_${GLAB_VERSION}_linux_amd64.deb" \
  && apt-get install -y /tmp/glab.deb \
  && rm -f /tmp/glab.deb

# NodeJS 20
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y --no-install-recommends nodejs

# npm global tools
npm install -g prettier
npm install -g renovate

# Install Bitwarden CLI
npm install -g @bitwarden/cli

# cleanup to reduce image size
apt-get clean
rm -rf /var/lib/apt/lists/*
