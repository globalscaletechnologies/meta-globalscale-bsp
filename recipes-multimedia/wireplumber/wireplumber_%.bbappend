FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:cortadodeck = " \
    file://51-cortadodeck-audio.conf \
"

do_install:append:cortadodeck() {
    install -d ${D}${sysconfdir}/wireplumber/wireplumber.conf.d
    install -m 0644 ${WORKDIR}/51-cortadodeck-audio.conf ${D}${sysconfdir}/wireplumber/wireplumber.conf.d/
}

FILES:${PN}:append:cortadodeck = " ${sysconfdir}/wireplumber/wireplumber.conf.d/51-cortadodeck-audio.conf"
