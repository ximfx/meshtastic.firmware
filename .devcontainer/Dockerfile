# trunk-ignore-all(terrascan/AC_DOCKER_0002)
# trunk-ignore-all(hadolint/DL3008)
# trunk-ignore-all(hadolint/DL3013)

FROM mcr.microsoft.com/devcontainers/cpp:1-debian-12

# Install build dependencies with cache cleanup in same layer
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        ca-certificates \
        g++ \
        git \
        libbluetooth-dev \
        libgpiod-dev \
        liborcania-dev \
        libssl-dev \
        libulfius-dev \
        libyaml-cpp-dev \
        pipx \
        pkg-config \
        python3 \
        python3-venv \
        wget \
        zip \
        usbutils \
        hwdata \
        gpg \
        gnupg2 \
        libusb-1.0-0-dev \
        libuv1-dev \
        libi2c-dev \
        libxcb-xkb-dev \
        libxkbcommon-dev \
        libinput-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Install Python tools and PlatformIO
#RUN python3 -m ensurepip --upgrade && \
#    python3 -m pip install --upgrade pip setuptools wheel && \
#    python3 -m pip install --user platformio && \
#    echo 'export PATH="$PATH:$HOME/.local/bin"' >> /home/vscode/.bashrc

# # Install PlatformIO via pipx
# RUN pipx install platformio \
#     && pipx ensurepath \
#     && echo 'export PATH="$PATH:/root/.local/bin"' >> /root/.bashrc

# Copy udev rules
COPY 99-platformio-udev.rules /etc/udev/rules.d/
RUN chmod 644 /etc/udev/rules.d/99-platformio-udev.rules && \
    chown root:root /etc/udev/rules.d/99-platformio-udev.rules

# Create workspace directories
RUN mkdir -p /workspace && \
    mkdir -p /var/lib/meshtasticd && \
    mkdir -p /etc/meshtasticd && \
    chown -R vscode:users /workspace && \
    chown -R vscode:users /var/lib/meshtasticd && \
    chown -R vscode:users /etc/meshtasticd

# Switch to vscode user
USER vscode

# Install PlatformIO via pipx
RUN pipx install platformio && \
    pipx ensurepath && \
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# Set environment variables
ENV PATH="/home/vscode/.local/bin:$PATH" \
    PLATFORMIO_CORE_DIR="/workspace/.platformio"

WORKDIR /workspace
# HEALTHCHECK NONE
