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

# Install Typst
RUN cargo install typst-cli --locked
RUN cargo install hayagriva --features cli
RUN cargo install utpm

# Link local abnt-quati package into preview namespace
ENV TYPST_PACKAGES_PATH="/root/.local/share/typst/packages"
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
