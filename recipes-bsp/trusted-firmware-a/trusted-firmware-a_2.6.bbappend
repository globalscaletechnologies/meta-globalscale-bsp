FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_deploy:append:bl31:globalscale-mt510ss-evk() {
	cp ${B}/${TFA_PLATFORM}/release/bl31/bl31.ld ${DEPLOY_DIR_IMAGE}/

	if [ "${@bb.utils.contains("DISTRO_FEATURES", "fwupdate", "1", "0", d)}" = "1" ]; then
		if [ "${@oe.utils.conditional("MACHINE", "globalscale-mt510ss-evk", "1", "", d)}" = "1" ]; then
			FWUPDATE_FIP_ID="f8191c07-8c6f-4f10-9655-1b85edc763e7"
		fi

		if [ -z "${FWUPDATE_FIP_ID}" ]; then
			bbwarn "FWUPDATE_FIP_ID is not defined, it can not support fwupdate."
		else
			mkeficapsule ${FWUPDATE_FIP_ARGS}
		fi
	fi
}
