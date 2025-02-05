FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:globalscale-mt510ss-evk = " \
    file://0001-dts-mediatek-add-Globalscale-MT510SS-evk-board.patch \
    file://0002-sound-mt6359-add-ext-amp-control-for-Speaker.patch \
    file://0003-mt8390-evk-add-speaker-dapm-widget.patch \
    file://0004-sound-codec-mt6359-add-Spk-Mux-for-Ext-Spaker.patch \
    file://0005-USB-serial-option-add-Quectel-RM520N.patch \
    file://0006-net-usb-qmi_wwan-add-Quectel-RM520N.patch \
    file://0007-net-ax88179-restrict-the-AX88179-to-support-only-ver.patch \
    file://0008-drm-mtk_dp-support-DisplayPort-direct-output.patch \
"

# Board specific config fragments
SRC_URI:append:globalscale-mt510ss-evk = " file://globalscale-mt510ss-evk.cfg "

SRC_URI:append = " \
	${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'file://virtualization.cfg', '', d)} \
"
