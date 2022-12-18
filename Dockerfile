FROM python:3.9-alpine

RUN pip config set global.index-url http://pypi.douban.com/simple &&  pip config set install.trusted-host pypi.douban.com/simple && pip install -U pip

ENV TZ=Asia/Shanghai
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --update --no-cache mariadb-connector-c-dev && \
    apk add --no-cache --virtual .build-deps mariadb-dev gcc musl-dev linux-headers \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone && rm -rf /var/cache/apk/*