SUMMARY = "Quectel Connection Manager"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
DESCRIPTION = "Quectel Connection Manager for LTE&5G modems"
FILESEXTRAPATHS:prepend := "${THISDIR}/quectel-CM/v${PV}:"

DEPENDS = "resolvconf"

SRC_URI = " \
    file://Makefile \
    file://QmiWwanCM.c \
    file://GobiNetCM.c \
    file://main.c \
    file://MPQMUX.c \
    file://MPQMUX.h \
    file://QMIThread.c \
    file://QMIThread.h \
    file://util.c \
    file://util.h \
    file://qmap_bridge_mode.c \
    file://mbim-cm.c \
    file://device.c \
    file://quectel-qmi-proxy.c \
    file://quectel-mbim-proxy.c \
    file://MPQCTL.h \
    file://MPQMI.h \
    file://atc.c \
    file://atchannel.c \
    file://atchannel.h \
    file://at_tok.c \
    file://at_tok.h \
    file://udhcpc.c \
    file://ethtool-copy.h \
"

S = "${WORKDIR}"
B = "${S}"

EXTRA_OEMAKE = "\
    'CC=${CC}' \
    'CFLAGS=${CFLAGS}' \
    'LFLAGS=${LDFLAGS}' \
"

do_install () {
    install -d      ${D}${sbindir}
    install -m 755  ${WORKDIR}/quectel-CM         ${D}${sbindir}
    install -m 755  ${WORKDIR}/quectel-qmi-proxy  ${D}${sbindir}
    install -m 755  ${WORKDIR}/quectel-mbim-proxy ${D}${sbindir}
}

FILES_${PN} += "${sbindir}/quectel-CM"
FILES_${PN} += "${sbindir}/quectel-qmi-proxy"
FILES_${PN} += "${sbindir}/quectel-mbim-proxy"
