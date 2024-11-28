# Amd64 build
FROM debian:bookworm-slim as bamd64
WORKDIR /app
COPY ./rathole/target/x86_64-unknown-linux-gnu/release/rathole .

# aarch64 build
FROM debian:bookworm-slim as barm64
WORKDIR /app
COPY ./rathole/target/aarch64-unknown-linux-musl/release/rathole .

ARG TARGETARCH
FROM b${TARGETARCH}
WORKDIR /app
USER 1000:1000
ENTRYPOINT ["./rathole"]