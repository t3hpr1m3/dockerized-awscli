FROM alpine:3.5

LABEL maintainer "Josh Williams <t3hpr1m3@gmail.com>"

ENV AWSCLI_VERSION 1.11.47

RUN apk add --update --virtual .install-reqs \
		build-base \
		ca-certificates \
		curl \
		gcc && \
	apk add groff \
		less \
		python \
		py-setuptools && \
	curl -sSL \
		https://github.com/aws/aws-cli/archive/${AWSCLI_VERSION}.tar.gz \
		-o /tmp/aws-cli-${AWSCLI_VERSION}.tar.gz && \
	cd /tmp && tar -xvzf aws-cli-${AWSCLI_VERSION}.tar.gz && \
	cd /tmp/aws-cli-${AWSCLI_VERSION} && \
	python setup.py install && \
	cd /tmp && \
	rm -rf /tmp/aws-cli-${AWSCLI_VERSION}* && \
	apk del .install-reqs && \
	rm /var/cache/apk/*

RUN apk add --update bash

ENTRYPOINT ["/usr/bin/aws"]
