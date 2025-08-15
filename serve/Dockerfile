FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    make \
    git \
    libmariadb-dev \
    libpcre3-dev \
    zlib1g-dev \
    bash-completion \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ---- File Emulador ---- #
RUN mkdir /emulador
WORKDIR /emulador

EXPOSE 5121 6121 6900
CMD ["bash"]