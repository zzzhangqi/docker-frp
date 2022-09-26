FROM alpine:3.16
ARG VERSION=0.44.0

WORKDIR /app
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk add --no-cache wget bash \
  && set -eux; \
  if [ "$(uname -m)" == "x86_64" ]; then \
    wget https://ghproxy.com/https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz; \
    tar zxf /app/frp_${VERSION}_linux_amd64.tar.gz -C /app; \
    mv /app/frp_${VERSION}_linux_amd64/ /app/frp; \
    rm -f /app/frp_${VERSION}_linux_amd64.tar.gz; \
  else \
    wget https://ghproxy.com/https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_arm64.tar.gz; \
    tar zxf /app/frp_${VERSION}_linux_arm64.tar.gz -C /app; \
    mv /app/frp_${VERSION}_linux_arm64 /app/frp; \
    rm -f /app/frp_${VERSION}_linux_arm64.tar.gz; \
  fi

COPY entrypoint.sh /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]