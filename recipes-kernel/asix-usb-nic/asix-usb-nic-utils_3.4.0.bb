require asix-usb-nic_3.4.0.inc

SRC_URI += " \
    file://0001-makefile-split-utils-module-and-_install-from-makefi.patch \
    file://0002-ax88179_programmer-fix-compiler-build-warning.patch \
"

do_compile() {
    oe_runmake utils
}

do_install() {
   install -Dm 0755 ${S}/ax88179_programmer ${D}${bindir}/ax88179_programmer
   install -Dm 0755 ${S}/ax88179b_179a_772e_772d_programmer ${D}${bindir}/ax88179b_179a_772e_772d_programmer
   install -Dm 0755 ${S}/ax88279_programmer ${D}${bindir}/ax88279_programmer
   install -Dm 0755 ${S}/ax88179b_179a_772e_772d_ieee ${D}${bindir}/ax88179b_179a_772e_772d_ieee
   install -Dm 0755 ${S}/axcmd ${D}${bindir}/axcmd
}

RRECOMMENDS:${PN} += "asix-usb-nic-drv"
