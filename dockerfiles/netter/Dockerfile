FROM debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		wget
RUN rm -rf /var/lib/apt/lists/*

ENV TERM xterm

COPY loops.sh /loops.sh
ENTRYPOINT ["/loops.sh"]
