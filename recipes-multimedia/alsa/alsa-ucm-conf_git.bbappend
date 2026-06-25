FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:cortadodeck = " \
    file://0001-alsa-ucm-conf-update-mt8391-evk-audio-routing-for-co.patch \
"

