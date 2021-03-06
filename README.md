# Debian development Kitchen Sink container image

<span style="color:red">This image and its Git repository are deprecated.</span>
Please switch to something else. I will no longer update this repository. See
below for alternatives that I'm using (some of which I maintain).

## Alternatives

- [tigercomputing/cloud-tools](https://hub.docker.com/r/tigercomputing/cloud-tools)
- [tigercomputing/puppet-lint](https://hub.docker.com/r/tigercomputing/puppet-lint)
- [pipelinecomponents/yamllint](https://hub.docker.com/r/pipelinecomponents/yamllint)

## Contents

This image is based on the standard `debian` image, with the following added:

- System utilities:
  - `eatmydata`
  - `procps`
  - `psmisc`
- General build tools:
  - `git`
  - `patch`
  - `pristine-tar`
  - `quilt`
- Debian build / packaging tools:
  - `build-essential`
  - `devscripts`
  - `dgit`
  - `fakeroot`
  - `git-buildpackage`
  - `jenkins-debian-glue`
  - `piuparts`
- Networking clients:
  - `ca-certificates`
  - `curl`
  - `publicsuffix`
  - `ssh-client`
  - `wget`
- Linting and testing tools:
  - `puppet-lint`
  - `shellcheck`
  - `shunit2`
  - `yamllint`
- Kubernetes clients:
  - `helm`
  - `kubectl`
- Cloud clients:
  - `awscli`
  - `mc` (Minio client)

## License

Copyright (C) 2018-2019  Chris Boot <bootc@bootc.net>

This project is licensed under the Apache License version 2.0. That is, the
`Dockerfile` and supporting materials in this Git repository are covered by the
Apache-2.0 license. Note that the contents of generated images are licensed
under a variety of other licenses including the GPL.
