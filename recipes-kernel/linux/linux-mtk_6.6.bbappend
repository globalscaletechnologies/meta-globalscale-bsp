FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:globalscale-mt510ss-evk = " \
    file://0001-dts-mediatek-add-Globalscale-Cortadobin-board.patch \
    file://0002-sound-mt6359-add-ext-amp-control-for-Speaker.patch \
    file://0003-mt8188-mt6359-add-speaker-dapm-widget.patch \
    file://0004-sound-codec-mt6359-add-Spk-Mux-for-Ext-Spaker.patch \
    file://0005-net-ax88179-restrict-the-AX88179-to-support-only-ver.patch \
    file://0006-input-mtk-pmic-keys-hacking-to-send-alt-keycode-for-.patch \
"

# Board specific config fragments
SRC_URI:append:globalscale-mt510ss-evk = " file://globalscale-mt510ss-evk.cfg "
