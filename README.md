# Telephant Docker Builder

This repo contains the Dockerfile to create a Docker Image that can build telephant.

Sounds complicated but has its advantages:
- Dont't worry about dependencies, this should contain it
- Build everywhere, you get docker to run
- Build on multiple machines in a docker swarm (don't know, if that works, didn't test)

## Usage:

### Prebuilt container image
If you want to do a fresh build of telephant on an AMD64-machine, just run this docker command:
```bash
docker pull cryptkiddie2/telephant-builder:latest
docker run -v /location/you/want/the/build/on/your/machine/in/:/result -it cryptkiddie2/telephant-builder:latest
```

Remember to change /location/you/want/the/build/on/your/machine/in/ to your needs but keep :/result as-is.

The docker container will then fetch telephant from github and build it in a very short time

### Build an own docker image

If you don't trust me or dockerhub or want to build telephant on another processor architecture (i368, arm) this way is for you.
The disadvantage is the long time it takes to install all required dependencies.

Run those commands to create you own builder-image

```bash
cd YOUR_WORKING_DIRECTORY
git clone https://github.com/CryptKid/telephant-docker/
cd telephant-docker
docker build . -t YOUR_IMAGE_NAME
```

then you can run as many builds as you want using 

```bash
docker run -v /location/you/want/the/build/on/your/machine/in/:/result -it YOUR_IMAGE_NAME
```

Replace the the keywords in UPPERCASE above with values of you choice.

Examples values:

| keyword                  | value                                |
| ------------------------ | ------------------------------------ |
| YOUR\_WORKING\_DIRECTORY | ~/builds/                            |
| YOUR\_IMAGE\_NAME        | cryptkiddie2/telephant-builder:local |
