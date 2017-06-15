# Raspberry Pi Yocto configuration
Custom configuration to build Linux image for Raspberry Pi using the Yocto project.
The compilation is performed within a Docker image named build-rpi.

## Clone the project
Project includes submodules to the Yocto core, openembedded, raspberry pi BSP and custom layers: meta-iot, meta-app.
To clone the projec with submodules:
```
git clone --recursive https://github.com/rdoumenc/rpi.git
```
## Build the docker image
```
make build
```
## Run the docker image
```
make run
```
