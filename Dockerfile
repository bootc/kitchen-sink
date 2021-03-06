ARG DEB_SUITE=buster

FROM debian/buildd:${DEB_SUITE}

ARG KUBECTL_VERSION=1.12.4
ARG HELM_VERSION=2.12.1

ARG BUILD_DATE=1970-01-01T00:00:00Z
ARG VCS_REF=

LABEL org.label-schema.vendor="Chris Boot" \
      org.label-schema.url="https://github.com/bootc/kitchen-sink" \
      org.label-schema.name="Debian development Kitchen Sink container image" \
      org.label-schema.license="Apache-2.0" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="https://git.boo.tc/bootc/kitchen-sink.git"

RUN set -eux; \
	apt-get update; \
	apt-get install -y \
		awscli \
		build-essential \
		curl \
		devscripts \
		eatmydata \
		piuparts \
		pristine-tar \
		procps \
		puppet-lint \
		quilt \
		shellcheck \
		shunit2 \
		wget \
		yamllint \
	; \
	apt-get install -y --no-install-recommends \
		dgit \
		git-buildpackage \
		jenkins-debian-glue \
	; \
	rm -rf /var/lib/apt/lists/\*

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

RUN set -eux; \
	curl -sLo /usr/local/bin/mc \
	"https://dl.minio.io/client/mc/release/linux-amd64/mc"; \
	chmod +x /usr/local/bin/mc; \
	mc version
