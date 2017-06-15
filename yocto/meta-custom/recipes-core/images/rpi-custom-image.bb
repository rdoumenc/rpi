# Base this image on core-image-minimal
include recipes-core/images/core-image-minimal.bb

IMAGE_FEATURE += "ssh-server-dropbear"

IMAGE_INSTALL += "kernel-modules \
                  wpa-supplicant \
                  iw \
                  mosquitto \
                  arhome \
                 "

