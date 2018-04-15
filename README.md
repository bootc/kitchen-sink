# Debian development Kitchen Sink container image

This image is based on the standard `debian` image, with the following added:

- System utilities (`procps`, `psmisc`)
- General build tools (`git`, `patch`)
- Debian build tools (`build-essential`, `devscripts`, `fakeroot`)
- Networking clients (`curl`, `wget`, `ssh-client`, `ca-certificates`,
  `publicsuffix`)
- Linting and testing tools (`puppet-lint`, `shunit2`, `yamllint`)
- Kubernetes clients (`kubectl`, `helm`)

## License

Copyright (C) 2018  Chris Boot <bootc@bootc.net>

This project is licensed under the Apache License version 2.0. That is, the
`Dockerfile` and supporting materials in this Git repository are covered by the
Apache-2.0 license. Note that the contents of generated images are licensed
under a variety of other licenses including the GPL.
