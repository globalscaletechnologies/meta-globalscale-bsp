FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:cortadodeck = " \
    file://0001-weston-keyboard-redesign-virtual-keyboard-UI-with-dy.patch \
    file://0002-desktop-shell-add-battery-icon-and-monitor-battery-e.patch \
"

