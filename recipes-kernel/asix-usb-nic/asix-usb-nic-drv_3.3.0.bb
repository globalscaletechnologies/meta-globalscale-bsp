require asix-usb-nic.inc

SRC_URI += " \
    file://0001-makefile-split-utils-module-and-_install-from-makefi.patch \
    file://0002-ax88179_programmer-fix-compiler-build-warning.patch \
"

inherit module

EXTRA_OEMAKE += " \
    KDIR=${STAGING_KERNEL_DIR} \
    KVER=${KERNEL_VERSION} \
"

MAKE_TARGETS = "modules"
