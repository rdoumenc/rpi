# Raspberry Pi Yocto configuration
How to configure and build a Linux image for Raspberry Pi using the Yocto project.

## Clone the project
Project includes submodules to the Yocto core, openembedded, raspberry pi BSP and custom layers: meta-iot, meta-app.
To clone the projec with submodules:
```
git clone --recursive https://github.com/rdoumenc/rpi.git
```
## Source bitbake environment
```
source ./poky/oe-init-build-env "rpi_build"
```
## Build
```
bitbake rpi-custom-image
```
# OLD: Project creation
The following steps have been used to create the base project. they are described here as reminders.
Now local files are stored in rpi_build/conf. Layers are checkout through submodules.
## Install Yocto environment
```
mkdir yocto
cd yocto

git clone -b krogoth git://git.yoctoproject.org/poky
git clone -b krogoth git://git.yoctoproject.org/meta-raspberrypi
git clone -b krogoth git://git.openembedded.org/meta-openembedded
git clone https://github.com/rdoumenc/meta-iot.git
git clone https://github.com/rdoumenc/meta-app.git
```

## Configure Yocto environment
```
source ./poky/oe-init-build-env "rpi_build"
```

Edit `conf/bblayers.conf` to modify the layer configuration
```
YOCTODIR := "${@os.path.abspath(os.path.dirname(d.getVar('FILE', True)) + '/../..')}"

BBLAYERS ?= " \
  ${YOCTODIR}/poky/meta \
  ${YOCTODIR}/poky/meta-yocto \
  ${YOCTODIR}/poky/meta-yocto-bsp \
  ${YOCTODIR}/meta-raspberrypi \
  ${YOCTODIR}/meta-openembedded/meta-oe \
  ${YOCTODIR}/meta-iot \
  ${YOCTODIR}/meta-app \
  "

BBLAYERS_NON_REMOVABLE ?= " \
  ${YOCTODIR}/poky/meta \
  ${YOCTODIR}/poky/meta-yocto \
  "
```

Edit `conf/local.conf`:
  - Add the raspberrypi machine
```
MACHINE ?= "raspberrypi"
```
  - Add the mosquitto package
```
IMAGE_INSTALL_append = " mosquitto"
```
