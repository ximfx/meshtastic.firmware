#!/bin/bash
podman --log-level=debug run -it \
    --userns=keep-id \
    --name firmware-dev \
    -v $(pwd):/workspace:Z \
    --user vscode \
    --workdir /workspace \
    firmware-devcontainer:latest