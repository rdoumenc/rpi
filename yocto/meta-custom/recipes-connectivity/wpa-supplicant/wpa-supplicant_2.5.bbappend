# Append the wpa-supplicant recipe with custom configuration

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://wpa_supplicant.conf-custom"

do_install_append () {

				install -d ${D}${sysconfdir}
				install -m 600 ${WORKDIR}/wpa_supplicant.conf-custom ${D}${sysconfdir}/wpa_supplicant.conf
}
