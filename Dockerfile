FROM python:3.9-alpine
LABEL org.opencontainers.image.authors="lihuacai168@gmail.com"

RUN apk add --update --no-cache mariadb-connector-c-dev \
	&& apk add --no-cache --virtual .build-deps \
		mariadb-dev \
		gcc \
		musl-dev \
	&& pip install mysqlclient==2.0.3 \
	&& apk del .build-deps
