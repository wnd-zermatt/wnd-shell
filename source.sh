# To use: source wnd.sh in your shell, then run: wnd

wnd() {
  mkdir -p ~/.wnd
  systemctl --user start podman.socket

  podman run --rm -it \
    --pull always \
    -v /var/run/user/$(id -u)/podman/podman.sock:/var/run/user/1000/podman/podman.sock \
    -v ~/.wnd:/home/wnd-admin \
    --tmpfs /tmp \
    --userns=keep-id:uid=$(id -u),gid=$(id -g) \
    ghcr.io/wnd-zermatt/wnd-shell:latest bash
}
