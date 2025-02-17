SUMMARY = "WCH CH343 USB-to-Serial driver"
DESCRIPTION = "Kernel module for WCH CH343 USB-to-Serial adapter."
HOMEPAGE = "https://github.com/WCHSoftGroup/ch343ser_linux"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "git://github.com/WCHSoftGroup/ch343ser_linux.git;branch=main;protocol=https"
SRCREV = "d4af1061e8d6c2ff004db392c146f2831d3ba431"

S = "${WORKDIR}/git"

SRC_URI += " \
    file://0001-Makefile-update-makefile-to-fix-build-error-for-yoct.patch \
"

inherit module

EXTRA_OEMAKE = "KERNELDIR=${STAGING_KERNEL_DIR}"

MODULES_INSTALL_TARGET = "install"

EXTRA_OEMAKE = ""

do_compile() {
    unset LDFLAGS
    oe_runmake -C "${STAGING_KERNEL_DIR}" M="${S}/driver" modules
}

do_install() {
    install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/extra
    install -m 0644 ${S}/driver/ch343.ko ${D}${base_libdir}/modules/${KERNEL_VERSION}/extra/

    install -D -p -m0644 ${S}/udev/99-ch34x.rules  ${D}${sysconfdir}/udev/rules.d/99-ch34x.rules
}

FILES:${PN}:append = " \
    ${sysconfdir}/udev/rules.d/99-ch34x.rules \
    #${nonarch_base_libdir}/modules/${KERNEL_VERSION}/extra/ch343.ko \
"

RPROVIDES:${PN} += " \
    kernel-module-ch343ser \
"
