FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:globalscale-mt510ss-evk = " \
    file://0001-board-mediatek-add-Globalscale-CORTADObin-board.patch \
    file://0002-configs-mediatek-add-new-configs-for-globalscale-COR.patch \
    file://0003-board-mt8370-add-gti-mt510ss-evk-firmware-update-uui.patch \
    file://0004-board-mt8370-turn-on-regulator-at-boot-if-regulator-.patch \
    file://0005-mt8370-add-delay-time-to-prevent-lcd-flicker.patch \
    file://0006-mediatek-mt8188-query-onboard-dram-memory-size.patch \
    file://0007-board-mt8370-fixup-device-tree-memory-size.patch \
    file://0008-cmd-axprog-Asix-USB-to-Ethernet-EEPROM-programming-u.patch \
    file://0009-configs-mt510ss-enable-asix-usb-to-ethernet-eeprom-p.patch \
"
