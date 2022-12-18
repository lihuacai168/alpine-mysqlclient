FROM python:3.9-alpine
LABEL org.opencontainers.image.authors="lihuacai168@gmail.com"

COPY req.txt .
# RUN apk add --update --no-cache mariadb-connector-c-dev \
# 	&& apk add --no-cache --virtual .build-deps \
# 		mariadb-dev \
# 		gcc \
# 		musl-dev \
# 	&& pip install req.txt \
# 	&& apk del .build-deps


RUN apk add --no-cache mariadb-connector-c-dev
RUN apk update &&  \
    apk add python3-dev mariadb-dev build-base netcat-openbsd linux-headers pcre-dev gcc musl-dev && \
	pip install req.txt && \
    apk del python3-dev mariadb-dev build-base linux-headers pcre-dev
