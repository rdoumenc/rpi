FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://interfaces.custom"

do_install_append() {
    install -d ${D}${sysconfdir}/network
    install -c -m 755 ${WORKDIR}/interfaces.custom ${D}${sysconfdir}/network/interfaces
}
