DESCRIPTION = "ASIX AX88279 Ethernet Driver"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "https://www.asix.com.tw/tw/support/download/file/1798?time=1723530130980;downloadfilename=asix_usb_nic_linux_driver_v${PV}.tar.bz2"
SRC_URI[sha256sum] = "09c4de9a39631e810d9100904941700ccf7da5fc4702beda0c88fa90ca7fd076"

S = "${WORKDIR}/asix_usb_nic_linux_driver_v${PV}"

EXTRA_OEMAKE += " \
    CFLAGS='${TARGET_CFLAGS}' \
"

TARGET_CC_ARCH += "${LDFLAGS}"
