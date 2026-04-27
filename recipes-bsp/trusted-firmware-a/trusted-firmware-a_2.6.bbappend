FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_deploy:append:bl31:cortadodeck() {
	cp ${B}/${TFA_PLATFORM}/release/bl31/bl31.ld ${DEPLOY_DIR_IMAGE}/

	if [ "${@bb.utils.contains("DISTRO_FEATURES", "fwupdate", "1", "0", d)}" = "1" ]; then
		if [ "${@oe.utils.conditional("MACHINE", "cortadodeck", "1", "", d)}" = "1" ]; then
			FWUPDATE_FIP_ID="b3d7f5a1-2c68-4bde-817f-9244a96c553d"
		fi

		if [ -z "${FWUPDATE_FIP_ID}" ]; then
			bbwarn "FWUPDATE_FIP_ID is not defined, it can not support fwupdate."
		else
			mkeficapsule ${FWUPDATE_FIP_ARGS}
		fi
	fi
}
