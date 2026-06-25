FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://triggerhappy.service \
    file://audio.conf \
"

do_install:append() {
    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
        install -d ${D}${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/triggerhappy.service \
            ${D}${systemd_unitdir}/system/triggerhappy.service
    fi

    install -d ${D}${sysconfdir}/triggerhappy/triggers.d
    install -m 0644 ${WORKDIR}/audio.conf \
        ${D}${sysconfdir}/triggerhappy/triggers.d/audio.conf
}

FILES:${PN}:append = " \
    ${sysconfdir}/triggerhappy/triggers.d/audio.conf \
"

CONFFILES:${PN}:append = " \
    ${sysconfdir}/triggerhappy/triggers.d/audio.conf \
"
