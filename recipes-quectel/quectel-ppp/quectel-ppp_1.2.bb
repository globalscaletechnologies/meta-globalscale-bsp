SUMMARY = "PPP Scripts for Basic Quectel Chip Operation"
SECTION = "net"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

RDEPENDS_${PN} = "ppp"

SRC_URI = " \
    file://quectel-ppp \
    file://quectel-chat-connect \
    file://quectel-chat-disconnect \
"

S = "${WORKDIR}"
B = "${S}/quectel-CM"

INITSCRIPT_NAME = "usb-modem"
INITSCRIPT_PARAMS = "defaults 15"

do_install () {
    install -d      ${D}${sysconfdir}/ppp/peers
    install -m 0755 ${S}/quectel-ppp                ${D}${sysconfdir}/ppp/peers/
    install -m 0755 ${S}/quectel-chat-connect       ${D}${sysconfdir}/ppp/peers/
    install -m 0755 ${S}/quectel-chat-disconnect    ${D}${sysconfdir}/ppp/peers/
}

FILES_${PN} += "{sysconfdir}/ppp/peers/quectel-ppp"
FILES_${PN} += "{sysconfdir}/ppp/peers/quectel-chat-connect"
FILES_${PN} += "{sysconfdir}/ppp/peers/quectel-chat-disconnect"
