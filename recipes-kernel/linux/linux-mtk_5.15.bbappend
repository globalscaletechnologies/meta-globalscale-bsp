FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:globalscale-mt510ss-evk = " \
    file://0001-dts-mediatek-add-Globalscale-MT510SS-evk-board.patch \
    file://0002-sound-codec-mt6359-add-external-amp-gpio.patch \
    file://0003-dts-gti-mt510ss-evk-add-Headphone-L-R-Ext-Spk-Amp-ro.patch \
    file://0004-dts-mt510ss-evk-remove-wifi2-node-mmc2.patch \
    file://0005-dts-gti-mt510ss-evk-fix-incorrect-shutdown-pin-for-I.patch \
    file://0006-Revert-dts-gti-mt510ss-evk-add-Headphone-L-R-Ext-Spk.patch \
    file://0007-Revert-sound-codec-mt6359-add-external-amp-gpio.patch \
    file://0008-dts-mt510ss-evk-change-sdcard-vmmc-supply-to-vmch_ex.patch \
    file://0009-dts-gti-mt510ss-evk-enable-DP-3.3v-power.patch \
    file://0010-dts-gti-mt510ss-evk-add-5G-modem-power-on-regulator.patch \
    file://0011-sound-mt6359-add-ext-amp-control-for-Speaker.patch \
    file://0012-mt8390-evk-add-speaker-dapm-widget.patch \
    file://0013-dts-gti-mt510ss-evk-add-external-amplifier-control-f.patch \
    file://0014-drm-mtk_dp-support-DisplayPort-direct-output.patch \
    file://0015-linux-mtk-mtk-dp-remove-verbose-message.patch \
    file://0016-USB-serial-option-add-Quectel-RM520N.patch \
    file://0017-net-usb-qmi_wwan-add-Quectel-RM520N.patch \
    file://0018-sound-codec-mt6359-add-Spk-Mux-for-Ext-Spaker.patch \
    file://0019-dts-gti-mt510ss-evk-modify-audio-routing-name.patch \
    file://0020-linux-mtk-mtk_dp-change-mtk_dp.c-file-attribute.patch \
    file://0021-dts-gti-mt510ss-evk-change-uart2-pins-to-GPIO-79-80-.patch \
    file://0022-dts-gti-mt510ss-evk-fix-uart2-and-spi2-pinmux-confli.patch \
    file://0023-net-ax88179-restrict-the-AX88179-to-support-only-ver.patch \
"

# Board specific config fragments
SRC_URI:append:globalscale-mt510ss-evk = " file://globalscale-mt510ss-evk.cfg "
