FROM node:lts-alpine
LABEL maintainer="vay1314"
ARG XDD_URL=https://github.com/vay1314/xdd-v-plus.git
ARG XDD_BRANCH=main
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    XDD_DIR=/xdd \
    ENABLE_WEB_XDD=false
WORKDIR ${XDD_DIR}
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
    && apk upgrade \
    && apk --no-cache add -f bash \
                             coreutils \
                             moreutils \
                             git \
                             curl \
                             wget \
                             tzdata \
                             perl \
                             openssl \
                             nginx \
                             python3 \
                             jq \
                             openssh \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && git clone -b ${XDD_BRANCH} ${XDD_URL} ${XDD_DIR} \
    && git config --global user.email "niuniuhaogou@gmail.com" \
    && git config --global user.name "vay1314" \
    && git config --global pull.rebase true \
    && cd ${XDD_DIR} \
    && rm -rf `ls|egrep -v '(demo)'` \
    && cp -r ${XDD_DIR}/demo/* .
    && chmod 777 ${XDD_DIR}/shell/*.sh \
    && chmod 777 ${XDD_DIR}/docker/*.sh \
    && chmod 777 ${XDD_DIR}/XDD-plus \
    && npm install -g pnpm \
    && pnpm install -g pm2 \
    && rm -rf /root/.npm \
    && pnpm install --prod \
    && rm -rf /root/.pnpm-store 
ENTRYPOINT ["./docker/docker-entrypoint.sh"]
