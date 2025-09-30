# To use: source wnd.sh in your shell, then run: wnd

wnd() {
  # Create ~/.wnd directory if it doesn't exist
  mkdir -p ~/.wnd

  docker run --rm -it \
    --pull always \
    --privileged \
    -v ~/.wnd:/home/wnd-admin \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ghcr.io/wnd-zermatt/wnd-shell:latest bash
}
