FILESEXTRAPATHS:prepend:globalscale-mt510ss-evk := "${THISDIR}/${PN}:"

RDEPENDS:${PN} += "bash"

SRC_URI += " \
    file://weston.ini \
    file://weston-ha.ini \
    file://cortadobin-ha.png \
    file://homeassistant-dashboard.sh \
"

do_install:append:globalscale-mt510ss-evk() {

    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'homeassistant', 'homeassistant', '', d)}" = "homeassistant" ]; then
        install -m 0644 ${WORKDIR}/weston-ha.ini ${D}${sysconfdir}/xdg/weston/weston.ini
        # install homeassistant-dashboard
        install -d "${D}${bindir}"
        install -m 0755 ${WORKDIR}/homeassistant-dashboard.sh ${D}${bindir}/homeassistant-dashboard
    else
        install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
    fi

    install -d "${D}${datadir}/weston"
    install -m 0644 ${WORKDIR}/cortadobin-ha.png ${D}${datadir}/weston/cortadobin-ha.png
}

FILES:${PN} += " \
    ${datadir}/weston/cortadobin-ha.png \
    ${bindir}/homeassistant-dashboard \
"
