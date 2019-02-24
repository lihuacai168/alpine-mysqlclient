FROM python:3.6.8-alpine3.7
MAINTAINER Takuya Noguchi <takninnovationresearch@gmail.com>

RUN apk add --update --no-cache mariadb-client-libs \
	&& apk add --no-cache --virtual .build-deps \
		mariadb-dev \
		gcc \
		musl-dev \
	&& pip install mysqlclient==1.4.0 \
	&& apk del .build-deps
