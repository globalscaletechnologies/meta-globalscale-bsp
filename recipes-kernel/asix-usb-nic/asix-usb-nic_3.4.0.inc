DESCRIPTION = "ASIX AX88279 Ethernet Driver"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "https://www.asix.com.tw/tw/support/download/file/1891?time=1735269319011;downloadfilename=asix_usb_nic_linux_driver_v${PV}.tar.bz2"
SRC_URI[sha256sum] = "3bd582dae7a3a7c0f32ecd5dcd8f8971475109aaedb6511ec4b0ce3d55e418eb"

S = "${WORKDIR}/ASIX_USB_NIC_Linux_Driver_Source_v${PV}"

EXTRA_OEMAKE += " \
    CFLAGS='${TARGET_CFLAGS}' \
"

TARGET_CC_ARCH += "${LDFLAGS}"
