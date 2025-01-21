FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:globalscale-mt510ss-evk = " \
    file://0001-board-mediatek-add-Globalscale-MT510SS-evk-board.patch \
    file://0002-configs-mediatek-add-new-configs-for-globalscale-MT5.patch \
    file://0003-board-mt8370-add-gti-mt510ss-evk-firmware-update-uui.patch \
    file://0004-dts-gti-mt510ss-evk-turn-on-1.8v-5v-system-power.patch \
    file://0005-dts-gti-mt510ss-evk-set-pca9554-as-gpio-controller.patch \
    file://0006-dts-gti-mt510ss-evk-add-pwm1-clock-to-dsi0-panel.patch \
    file://0007-board-mt8370-turn-on-regulator-at-boot-if-regulator-.patch \
    file://0008-dts-gti-mt510ss-evk-add-smbios-value-to-device-tree.patch \
    file://0009-config-mt510ss_evk-enable-sysinfo-feature.patch \
    file://0010-mt8370-add-delay-time-to-prevent-lcd-flicker.patch \
    file://0011-mediatek-mt8188-query-onboard-dram-memory-size.patch \
    file://0012-board-mt8370-fixup-device-tree-memory-size.patch \
"

