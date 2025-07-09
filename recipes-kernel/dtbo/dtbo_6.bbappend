
FILESEXTRAPATHS:prepend:globalscale-mt510ss-evk:= "${THISDIR}/v6/globalscale-mt510ss-evk:"

SRC_URI:append:globalscale-mt510ss-evk = " \
	file://isp71.dtsi \
	file://mtk-camera.dtsi \
	file://camera-common.dtsi \
	file://camera-imx214-csi0.dts \
	file://camera-imx214-2lanes-csi0.dts \
	file://camera-imx214-csi0-std.dts \
	file://display-dp.dts \
	file://display-hdmi.dts \
	file://display-dsi.dts \
	file://audio-sof.dts \
	file://raspberrypi-hat.dts \
	file://spi-test.dts \
	file://can.dts \
"
