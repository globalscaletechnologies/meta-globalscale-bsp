FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:globalscale-mt510ss-evk = " \
    file://0001-board-mediatek-add-Globalscale-MT510SS-evk-board.patch \
    file://0002-configs-mediatek-add-new-configs-for-globalscale-MT5.patch \
    file://0003-board-mt8370-add-gti-mt510ss-evk-firmware-update-uui.patch \
    file://0004-dts-gti-mt510ss-evk-turn-on-1.8v-5v-system-power.patch \
"

