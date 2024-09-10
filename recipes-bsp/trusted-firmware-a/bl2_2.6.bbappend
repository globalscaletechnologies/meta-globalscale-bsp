FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_deploy:append:globalscale-mt510ss-evk() {
	install -m 0644 ${B}/bl2.img ${DEPLOYDIR}/
	if [ "${@oe.utils.conditional('BL2_SIGN_ENABLE', '1', '1', '', d)}" = "1" ]; then
		install -m 0644 ${RECIPE_SYSROOT}/${sysconfdir}/secure/efuse.cfg ${DEPLOYDIR}/
	fi

	if [ "${@bb.utils.contains("DISTRO_FEATURES", "fwupdate", "1", "0", d)}" = "1" ]; then
		if [ "${@oe.utils.conditional("MACHINE", "globalscale-mt510ss-evk", "1", "", d)}" = "1" ]; then
			FWUPDATE_TFA_ID="87ef4432-e654-4ee5-8ec7-11638d9f273f"
		fi

		if [ -z "${FWUPDATE_TFA_ID}" ]; then
			bbwarn "FWUPDATE_TFA_ID is not defined, it can not support fwupdate."
		else
			mkeficapsule ${FWUPDATE_TFA_ARGS}
		fi
	fi
}
