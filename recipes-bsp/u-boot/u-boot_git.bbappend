FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-board-mediatek-add-Globalscale-MT510SS-evk-board.patch \
    file://0002-configs-mediatek-add-new-configs-for-globalscale-MT5.patch \
"

