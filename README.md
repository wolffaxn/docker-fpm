# docker-fpm

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/docker-fpm/main.svg)](https://github.com/wolffaxn/docker-fpm)

> A Docker image to build packages such as rpms, debs and macos packages.

## Build

Run this command to build an image.

```
make
```

To enable BuildKit build set the DOCKER_BUILDKIT=1 environment variable when invoking the docker build command,
such as:

```
export DOCKER_BUILDKIT=1
make
```

## Run

```
❯ docker run --rm -it wolffaxn/docker-fpm
Doing `require 'backports'` is deprecated and will not load any backport in the next major release.
Require just the needed backports instead, or 'backports/latest'.
1.11.0

```

## License

Released under the MIT License. See [license](LICENSE.md) for details.
