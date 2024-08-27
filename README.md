# ArgoPi-FW
Yocto Build for the OS onboard the ArgoPi

# Quickstart
> Note: Only tested on Linux, probably will work on MacOS, not sure about Windows (might not have to worry about UID and GID in Windows)

1. Install Docker (https://docs.docker.com/engine/install/)
2. Run `git submodule update --init --recursive`
3. Run

```bash
export UID=$(id -u)
export GID=$(id -g)
docker compose run --rm --build yocto-build`
```
4. In the docker container, run
```bash
. sources/poky/oe-init-build-env
bitbake core-image-minimal 
```
