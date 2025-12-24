# WND-shell

shell in a container with tools for managing our infrastructure:

- ansible
- molecule (ansible testing)
- linting: prettier, yamllint, ...
- ldap-utils
- glab (gitlab cli client)
- renovate

## Requirements

- podman

## Setup

- create .wnd directory in your home directory `mkdir ~/.wnd`
- copy things like ssh keys, configs and other stuff you want to use in the container to `~/.wnd`
- copy `.wnd-env.example` in this repo to `~/.wnd/.wnd-env` and adjust it to your needs
- start the container and configure bitwarden cli: `bw config server https://mybw.example.com`

## Usage

`source <(curl -s https://raw.githubusercontent.com/wnd-zermatt/wnd-shell/refs/heads/main/source.sh)`

provides the `wnd` command. You might want to add this line to your `.bashrc`.

use `wnd --pull` to pull latest image before starting the container.

after starting a shell with the `wnd` command, use `unlock` to unlock things like ssh key and ansible vault password from bitwarden.

## Tools

### Helper Commands

**go**: does `ssh` and `sudo su -` in one single command, usage: `go my-server`

### Renovate

Renovate is a tool to automate dependency updates. It can be used to keep your project dependencies up-to-date.

run it inside the wnd container like this: `renovate --platform=local`
