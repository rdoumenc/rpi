SUMMARY = "A small image based on core-image-minimal with Qt support."

LICENSE = "MIT"

inherit core-image

IMAGE_FEATURES += "splash ssh-server-dropbear hwcodecs"

IMAGE_INSTALL = " \
  ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
  ${CORE_IMAGE_EXTRA_INSTALL} \
  packagegroup-core-boot \
  kernel-modules \
  wpa-supplicant \
  iw \
  mosquitto \
  kernel-module-brcmfmac \
	kernel-module-rpi-ft5406 \
  kernel-module-evdev \
	kernel-module-rpi-backlight \
  wayland weston \
"

CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples"

DISTRO_FEATURES_append = " opengl wayland"
DISTRO_FEATURES_remove = " x11"

IMAGE_LINGUAS = " "

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
