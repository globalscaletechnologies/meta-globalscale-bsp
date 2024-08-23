FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:globalscale-mt510ss-evk = " \
    file://0001-dts-mediatek-add-Globalscale-MT510SS-evk-board.patch \
    file://0002-sound-codec-mt6359-add-external-amp-gpio.patch \
    file://0003-dts-gti-mt510ss-evk-add-Headphone-L-R-Ext-Spk-Amp-ro.patch \
    file://0004-dts-mt510ss-evk-remove-wifi2-node-mmc2.patch \
"

# Board specific config fragments
SRC_URI:append:globalscale-mt510ss-evk = " file://globalscale-mt510ss-evk.cfg "
