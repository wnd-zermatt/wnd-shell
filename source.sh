#!/usr/bin/env bash

case "$(uname -s)" in
  Linux*)
    source "$(dirname "${BASH_SOURCE[0]}")/source-linux.sh"
    ;;
  Darwin*)
    source "$(dirname "${BASH_SOURCE[0]}")/source-macos.sh"
    ;;
  *)
    echo "Unsupported OS: $(uname -s)"
    return 1
    ;;
esac
