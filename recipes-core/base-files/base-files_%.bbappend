FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

FILESEXTRAPATHS:prepend:cortadodeck := "${THISDIR}/files/cortadodeck:"

SRC_URI:append:cortadodeck = " \
	file://99-cortadodeck-radio.rules \
"

do_install:append:cortadodeck() {
	# cortadodeck m.2 radio board
	install -D -p -m0644 ${WORKDIR}/99-cortadodeck-radio.rules \
		${D}${sysconfdir}/udev/rules.d/99-cortadodeck-radio.rules
}
