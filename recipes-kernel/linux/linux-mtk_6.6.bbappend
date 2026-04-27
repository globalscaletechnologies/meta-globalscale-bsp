FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Board specific config fragments
SRC_URI:append:cortadodeck = " file://cortadodeck.cfg "

SRC_URI:append:cortadodeck = " \
    file://0001-drm-panel-fitipower-ek79007ad-Add-support-for-Hongca.patch \
    file://0002-drm-panel-panel-edp-Add-support-for-Microtech-MTF070.patch \
    file://0003-drm-mediatek-dp-Use-default-link-rate-when-eDP-panel.patch \
    file://0004-usb-typec-ts3usbca4-defer-probe-when-ts3usbca4-is-no.patch \
    file://0005-supply-add-richtek-rt9426a-battery-driver-support.patch \
    file://0006-ASoC-mediatek-mt8189-add-board-GPIO-controls-for-spe.patch \
    file://0007-dts-add-globalscale-cortadodeck-board.patch \
"

 
