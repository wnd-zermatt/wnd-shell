# To use: source wnd.sh in your shell, then run: wnd

wnd() {
  mkdir -p ~/.wnd

  podman run --rm -it \
    --pull always \
    --privileged \
    -v ~/.wnd:/home/wnd-admin \
    --userns=keep-id:uid=$(id -u),gid=$(id -g) \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ghcr.io/wnd-zermatt/wnd-shell:latest bash
}
