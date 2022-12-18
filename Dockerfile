FROM python:3.9-alpine
RUN pip config set global.index-url http://pypi.douban.com/simple &&  pip config set install.trusted-host pypi.douban.com/simple && pip install -U pip

ENV TZ=Asia/Shanghai
RUN apk update && apk add --no-cache mariadb-connector-c-dev && \
    apk add python3-dev mariadb-dev build-base netcat-openbsd linux-headers pcre-dev && \
    echo $TZ > /etc/timezone 

