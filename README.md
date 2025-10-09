# WND-shell

shell in a container with tools for managing our infrastructure:

- ansible
- molecule (ansible testing)
- prettier, yamllint, ...

## Requirements

- podman

## Setup

- create .wnd directory in your home directory `mkdir ~/.wnd`
- copy things like ssh keys, configs and other stuff you want to use in the container to `~/.wnd`

## Usage

`source <(curl -s https://raw.githubusercontent.com/wnd-zermatt/wnd-shell/refs/heads/main/source.sh)`

provides the `wnd` command. You might want to add it to your `.bashrc`.
