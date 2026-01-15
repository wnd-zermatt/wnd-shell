# To use: source wnd.sh in your shell, then run: wnd

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
  systemctl --user start podman.socket

  podman run --rm -it ${pull_flag} \
    -v /var/run/user/$(id -u)/podman/podman.sock:/var/run/user/1000/podman/podman.sock \
    -v ~/.wnd:/home/wnd-admin \
    --network=host \
    --cap-add=NET_RAW \
    --tmpfs /tmp \
    --userns=keep-id:uid=$(id -u),gid=$(id -g) \
    ghcr.io/wnd-zermatt/wnd-shell:latest-amd64 bash
}
