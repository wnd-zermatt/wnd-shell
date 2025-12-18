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
- start the container and configure bitwarden cli: `bw config server https://mybw.example.com`

### wnd-env

create `~/.wnd-env` and add required values:

```bash
export BW_SSH_KEY_ID="abcd42"
export BW_ANSIBLE_VAULT_PASSWORD_ID="efgh24"
```

this is used by the `unlock` command to unlock things like your ssh key and ansible vault password from bitwarden.

## Usage

`source <(curl -s https://raw.githubusercontent.com/wnd-zermatt/wnd-shell/refs/heads/main/source.sh)`

provides the `wnd` command. You might want to add this line to your `.bashrc`.

use `wnd --pull` to pull latest image before starting the container.

then run `unlock` to unlock ssh key and ansible vault.

## Tools

### Renovate

Renovate is a tool to automate dependency updates. It can be used to keep your project dependencies up-to-date.

run it inside the wnd container like this: `renovate --platform=local`

### Bitwarden CLI


