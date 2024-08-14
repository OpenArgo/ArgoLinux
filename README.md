# ArgoPi-FW
Yocto Build for the OS onboard the ArgoPi

# Quickstart
1. Install Docker (https://docs.docker.com/engine/install/)
2. Run `git submodule update --init --recursive`
3. Run `docker compose run --rm --build yocto-build`
4. In the docker container, run `. sources/poky/oe-init-build-env`, then run `bitbake core-image-minimal` 
