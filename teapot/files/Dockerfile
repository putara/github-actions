FROM rust:alpine3.24 AS builder
WORKDIR /src/teapot/

# tikv-jemalloc requires make
RUN apk add --no-cache make

COPY . .
RUN cargo build --release --locked -j $(nproc)

FROM alpine:3.24
WORKDIR /app/

COPY --from=builder /src/teapot/target/release/teapot ./
COPY --from=builder /src/teapot/config/teapot.example.toml ./config/teapot.example.toml
COPY --from=builder /src/teapot/public ./public

RUN adduser -h /app/ -D -s /bin/sh teapot && \
    chown -R teapot /app
USER teapot

CMD ["./teapot"]
