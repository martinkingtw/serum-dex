FROM rust:1.57.0 as builder

ADD . /app
WORKDIR /app

RUN apt-get update && apt-get install libudev-dev && cd ./dex/crank && cargo build --release
RUN --mount=type=secret,id=solana_secret,dst=/app/id.json

FROM rust:1.57.0 as runner

COPY --from=builder /app/target /app
COPY --from=builder /app/id.json /app/.config/solana/id.json
COPY --from=builder /app/entrypoint.sh /app/entrypoint.sh
WORKDIR /app

CMD [ "/bin/bash", "/app/entrypoint.sh" ]
ENTRYPOINT [ "/bin/bash", "/app/entrypoint.sh" ]
