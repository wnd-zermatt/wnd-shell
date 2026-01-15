i#!/usr/bin/env bash

wnd() {
  local pull_flag=""
  local podman_args=()

  while [ $# -gt 0 ]; do
    case "$1" in
      --pull|--pull=*) pull_flag="--pull=always"; shift ;;
      --) shift; while [ $# -gt 0 ]; do podman_args+=("$1"); shift; done; break ;;
      *) podman_args+=("$1"); shift ;;
    esac
  done

  mkdir -p ~/.wnd

  # Ensure podman machine is running
  if ! podman machine inspect 2>/dev/null | grep -q '"State": "running"'; then
    echo "Starting podman machine..."
    podman machine start
  fi

  # macOS uses a different socket location
  local socket_path="$HOME/.local/share/containers/podman/machine/podman.sock"
  
  # Fallback if socket doesn't exist
  if [ ! -S "$socket_path" ]; then
    socket_path=$(podman machine inspect | grep -o '"ConnectionInfo".*"Path":"[^"]*"' | grep -o '/[^"]*sock')
    if [ -z "$socket_path" ]; then
      echo "Error: Could not find podman socket"
      return 1
    fi
  fi

  podman run --rm -it ${pull_flag} \
    -v "${socket_path}:/var/run/user/1000/podman/podman. sock" \
    -v ~/. wnd:/home/wnd-admin \
    --network=host \
    --cap-add=NET_RAW \
    --tmpfs /tmp \
    --userns=keep-id:uid=$(id -u),gid=$(id -g) \
    "${podman_args[@]}" \
    ghcr.io/wnd-zermatt/wnd-shell:latest bash
}
