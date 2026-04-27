FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:cortadodeck = " \
    file://0001-dts-cortadodeck-add-Globalscale-Cortadodeck-board.patch \
    file://0002-configs-cortadodeck-add-defconfig-for-Cortadodeck-bo.patch \
    file://0003-configs-mt8391-add-Cortadodeck-firmware-capsule-UUID.patch \
    file://0004-board-mediatek-genio-720-evk-reset-WWAN-module-for-C.patch \
"

