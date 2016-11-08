FROM debian:jessie
MAINTAINER Josh Williams <t3hpr1m3@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		python \
		unzip \
		groff \
		less \
	&& curl -sSL \
		https://s3.amazonaws.com/aws-cli/awscli-bundle.zip \
		-o /tmp/awscli-bundle.zip \
	&& cd /tmp && unzip awscli-bundle.zip \
	&& /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
	&& rm -rf /tmp/awscli-bundle* \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get purge -y --auto-remove

ENTRYPOINT ["/usr/local/bin/aws"]
