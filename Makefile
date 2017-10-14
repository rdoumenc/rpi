# Makefile to build and run the docker image

USER_ID := "$(shell id -u $(USER))"
CDIR := "$(shell pwd)"
BUILD_DIR := "$(CDIR)/build"
YOCTO_DIR := "$(CDIR)/yocto"

all: build

build:
	@ docker build --no-cache -t build-rpi dockerfiles/build-rpi/

run:
	@ if [ ! -d $(BUILD_DIR) ]; then \
	    mkdir $(BUILD_DIR); \
	    cp -r $(YOCTO_DIR)/build_template/* $(BUILD_DIR); \
	  fi
	@ docker run -t --volume=$(CDIR)/yocto:/workspace/yocto \
	  --volume=$(BUILD_DIR):/workspace/build build-rpi \
	  /bin/bash -c 'source /workspace/yocto/poky/oe-init-build-env /workspace/build && bitbake rpi-custom-image'

run-shell:
	@ docker run -ti --volume=$(CDIR)/yocto:/workspace/yocto \
	  --volume=$(BUILD_DIR):/workspace/build build-rpi \
	  /bin/bash

clean:
	@ rm -rf $(BUILD_DIR)

