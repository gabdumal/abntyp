FROM fedora:latest

# Create dummy xdg-open to prevent programs that would like to open applications from crashing
RUN printf '#!/bin/sh\nexit 0\n' > /usr/local/bin/xdg-open && chmod +x /usr/local/bin/xdg-open

# Install system dependencies
RUN dnf upgrade -y
RUN dnf install -y \
    ca-certificates \
    curl \
    gcc \
    git \
    libatomic \
    openssl-devel

## Prefer system OpenSSL (use the installed openssl-devel) instead of building OpenSSL from source
ENV OPENSSL_NO_VENDOR=1

# Install project dependencies
RUN dnf install -y \
    liberation-fonts \
    make \
    perl \
    pkgconf-pkg-config

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
ENV CARGO_HOME="/root/.cargo"
ENV CARGO_TARGET="/workspace/target"
ENV PATH="$CARGO_HOME/bin:$PATH"

## Install Cargo dev tools
RUN cargo install cargo-watch

# Install Typst
RUN cargo install typst-cli --locked
RUN cargo install utpm
RUN cargo install hayagriva --features cli
