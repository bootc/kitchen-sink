ARG DEB_SUITE=buster

FROM debian:${DEB_SUITE}

ARG KUBECTL_VERSION=1.10.0
ARG HELM_VERSION=2.8.2

LABEL org.label-schema.vendor="Chris Boot" \
      org.label-schema.url="https://github.com/bootc/kitchen-sink" \
      org.label-schema.name="Debian development Kitchen Sink container image" \
      org.label-schema.license="Apache-2.0" \
      org.label-schema.schema-version="1.0"

RUN set -eux; apt-get update; apt-get install -y --no-install-recommends \
		build-essential \
		ca-certificates \
		curl \
		fakeroot \
		git \
		patch \
		publicsuffix \
		puppet-lint \
		shunit2 \
		ssh-client \
		wget \
		yamllint \
	; rm -rf /var/lib/apt/lists/\*

RUN set -eux; \
	curl -sLo /usr/local/bin/kubectl \
	"https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl"; \
	chmod +x /usr/local/bin/kubectl; \
	kubectl version --client

RUN set -eux; \
	curl -sLo helm.tar.gz \
	"https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz"; \
	tar xzf helm.tar.gz --strip-components=1 linux-amd64/helm; rm helm.tar.gz; \
	mv helm /usr/local/bin/helm; \
	helm version --client
