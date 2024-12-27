require asix-usb-nic_3.4.0.inc

SRC_URI += " \
    file://0001-makefile-split-utils-module-and-_install-from-makefi.patch \
    file://0002-ax88179_programmer-fix-compiler-build-warning.patch \
    file://blacklist-asix-nic.conf \
"

inherit module

EXTRA_OEMAKE += " \
    KDIR=${STAGING_KERNEL_DIR} \
    KVER=${KERNEL_VERSION} \
"

do_install:append:globalscale-mt510ss-evk() {
    install -d ${D}${sysconfdir}/modprobe.d
    install -m 0644 ${WORKDIR}/blacklist-asix-nic.conf ${D}${sysconfdir}/modprobe.d/blacklist-asix-nic.conf
}

MAKE_TARGETS = "modules"

FILES:${PN}:append:globalscale-mt510ss-evk = " \
	${sysconfdir}/modprobe.d/blacklist-asix-nic.conf \
"
