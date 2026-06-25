FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:cortadodeck = " \
    file://main.conf \
"

do_install:append:cortadodeck() {
    install -d ${D}${sysconfdir}/bluetooth
    install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/bluetooth/main.conf
}
