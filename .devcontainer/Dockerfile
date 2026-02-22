FROM rust:latest

# Update packages
RUN apt-get update

# Install dependencies
RUN apt-get install fonts-liberation -y

# Install packages globally
RUN cargo install typst-cli --locked
RUN cargo install utpm
