FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:globalscale-mt510ss-evk = " \
    file://0001-keyboard-Implement-Gboard-style-virtual-keyboard-wit.patch \
    file://0002-keyboard-add-gradient-color-effect.patch \
"

