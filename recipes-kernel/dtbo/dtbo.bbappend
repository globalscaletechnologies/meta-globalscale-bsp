
FILESEXTRAPATHS:prepend:globalscale-mt510ss-evk:= "${THISDIR}/globalscale-mt510ss-evk:"

SRC_URI:append:globalscale-mt510ss-evk = " \
	file://display-dsi.dts \
	file://display-hdmi.dts \
	file://display-dp.dts \
	file://display-dsidp.dts \
	file://display-hdmidp.dts \
	file://display-headless.dts \
	file://isp71.dtsi \
	file://mtk-camera.dtsi \
	file://camera-common.dtsi \
	file://camera-imx214-csi0.dts \
	file://camera-imx214-2lanes-csi0.dts \
	file://camera-imx214-csi0-std.dts \
	file://audio-sof.dts \
	file://raspberrypi-hat.dts \
"
