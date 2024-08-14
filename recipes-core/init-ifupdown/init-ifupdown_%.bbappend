FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:globalscale-mt510ss-evk = " \
	file://globalscale-mt510ss-evk-interfaces \
"

do_install:append:globalscale-mt510ss-evk() {
	install -d ${D}${sysconfdir}/network/
	install -m 0644 ${WORKDIR}/globalscale-mt510ss-evk-interfaces ${D}${sysconfdir}/network/interfaces
}
