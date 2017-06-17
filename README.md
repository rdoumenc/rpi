# Raspberry Pi Yocto configuration
Custom configuration to build Linux image for Raspberry Pi using the Yocto project.
The compilation is performed within a Docker image named build-rpi.

## Clone the project
Project includes submodules to the Yocto core, openembedded, raspberry pi BSP and custom layers: meta-iot, meta-app.
To clone the project with submodules:
```
git clone --recursive https://github.com/rdoumenc/rpi.git
```
## Dependencies
Docker must be installed.

## Build the docker image
```
make build
```
## Run compilation within the docker image
```
make run
```
