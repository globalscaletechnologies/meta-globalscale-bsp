FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_deploy:append:cortadodeck() {
	install -m 0644 ${B}/bl2.img ${DEPLOYDIR}/
	if [ "${@oe.utils.conditional('BL2_SIGN_ENABLE', '1', '1', '', d)}" = "1" ]; then
		install -m 0644 ${RECIPE_SYSROOT}/${sysconfdir}/secure/efuse.cfg ${DEPLOYDIR}/
	fi

	if [ "${@bb.utils.contains("DISTRO_FEATURES", "fwupdate", "1", "0", d)}" = "1" ]; then
		if [ "${@oe.utils.conditional("MACHINE", "cortadodeck", "1", "", d)}" = "1" ]; then
			FWUPDATE_TFA_ID="91e2c4d8-77ab-43ef-b219-638ad10f2e6a"
		fi

		if [ -z "${FWUPDATE_TFA_ID}" ]; then
			bbwarn "FWUPDATE_TFA_ID is not defined, it can not support fwupdate."
		else
			mkeficapsule ${FWUPDATE_TFA_ARGS}
		fi
	fi
}
