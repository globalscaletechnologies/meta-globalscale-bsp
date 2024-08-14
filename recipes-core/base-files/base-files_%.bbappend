FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

FILESEXTRAPATHS:prepend:globalscale-mt510ss-evk := "${THISDIR}/files/globalscale-mt510ss-evk:"

SRC_URI:append:globalscale-mt510ss-evk = " \
	file://usbgadget.conf \
	file://wwan-5g.sh \
	file://wwan-5g.service \
	file://91-caninterface.rules \
"

do_install:append:globalscale-mt510ss-evk() {
	install -d ${D}${systemd_unitdir}/system
	install -d ${D}${sysconfdir}/init.d

	# Define default USB gadget port (ADB)
	install -m 0644 ${WORKDIR}/usbgadget.conf ${D}${sysconfdir}/usbgadget.conf

	# Create folder for services enabled by default
	install -d ${D}/${sysconfdir}/systemd/system/multi-user.target.wants/

	# WWAN 5G Card service
	install -m 0644 ${WORKDIR}/wwan-5g.service ${D}${systemd_unitdir}/system/
	install -m 0755 ${WORKDIR}/wwan-5g.sh ${D}${sysconfdir}/init.d/
	install -m 0755 ${WORKDIR}/wwan-5g.sh ${D}${systemd_unitdir}
	# User should enable it manually or they sure it can be enabled by default.
	# ln -sfr ${D}/${systemd_system_unitdir}/wwan-5g.service ${D}/${sysconfdir}/systemd/system/multi-user.target.wants/wwan-5g.service

	# can bus
	install -D -p -m0644 ${WORKDIR}/91-caninterface.rules \
		${D}${sysconfdir}/udev/rules.d/91-caninterface.rules
}

FILES:${PN}:append:globalscale-mt510ss-evk = " \
	${sysconfdir}/usbgadget.conf \
	${systemd_unitdir}/system/wwan-5g.service \
"
