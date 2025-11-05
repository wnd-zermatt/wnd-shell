#!/usr/bin/env bash
set -euo pipefail

# Append PS1 and helper to global bashrc in a way safe for Docker build layering

cat >> /etc/bash.bashrc <<'BASH'
export PS1='\[\e[1;37m\]W\[\e[1;31m\]N\[\e[1;37m\]D\[\e[0m\] \[\e[0;36m\]\u:\[\e[0;33m\]\w\[\e[0m\]\$ '
BASH
