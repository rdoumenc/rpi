SUMMARY = "A small image based on core-image-minimal."

LICENSE = "MIT"

inherit core-image

IMAGE_FEATURE += "ssh-server-dropbear"

IMAGE_INSTALL = "${ROOTFS_PKGMANAGE_BOOTSTRAP} \
                 ${CORE_IMAGE_EXTRA_INSTALL} \
                 packagegroup-core-boot \
                 kernel-modules \
                 wpa-supplicant \
                 iw \
                 mosquitto \
                 arhome \
                "

IMAGE_LINGUAS = " "

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
