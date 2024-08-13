DESCRIPTION = "Quectel pcie_mhi driver"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

FILESEXTRAPATHS:prepend := "${THISDIR}/Quectel_Linux_PCIE_MHI_Driver/v${PV}:"

S = "${WORKDIR}/pcie_mhi"

SRC_URI += " \
    file://pcie_mhi/Makefile \
    file://pcie_mhi/core/mhi_init.c \
    file://pcie_mhi/core/mhi_main.c \
    file://pcie_mhi/core/mhi_pm.c \
    file://pcie_mhi/core/mhi_boot.c \
    file://pcie_mhi/core/mhi_dtr.c \
    file://pcie_mhi/core/mhi.h \
    file://pcie_mhi/core/mhi_internal.h \
    file://pcie_mhi/controllers/mhi_qti.c \
    file://pcie_mhi/controllers/mhi_qti.h \
    file://pcie_mhi/devices/mhi_uci.c \
    file://pcie_mhi/devices/mhi_netdev_quectel.c \
"

inherit module

EXTRA_OEMAKE += " \
    KDIR=${STAGING_KERNEL_DIR} \
    KVER=${KERNEL_VERSION} \
"

MAKE_TARGETS = "modules"
