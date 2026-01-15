#!/usr/bin/env bash

case "$(uname -s)" in
  Linux*)
    source <(curl -s https://raw.githubusercontent.com/wnd-zermatt/wnd-shell/refs/heads/main/source-linux.sh)
    ;;
  Darwin*)
    source <(curl -s https://raw.githubusercontent.com/wnd-zermatt/wnd-shell/refs/heads/main/source-macos.sh)
    ;;
  *)
    echo "Unsupported OS: $(uname -s)"
    return 1
    ;;
esac
