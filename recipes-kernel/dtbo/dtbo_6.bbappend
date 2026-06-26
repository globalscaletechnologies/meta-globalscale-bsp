
FILESEXTRAPATHS:prepend:cortadodeck:= "${THISDIR}/v6/cortadodeck:"

SRC_URI:append:cortadodeck = " \
	file://ufs.dts \
	file://camera-common-std.dtsi \
	file://camera-imx258-csi0-std.dts \
	file://camera-imx258-csi1-std.dts \
	file://camera-imx258-dual-std.dts \
	file://camera-ov5640-csi0-std.dts \
	file://camera-ov5640-csi1-std.dts \
	file://camera-ov5640-dual-std.dts \
	file://camera-imx258-csi0-ov5640-csi1-std.dts \
	file://spi-test.dts \
	file://display-dsi.dts \
	file://display-edp-fhd.dts \
	file://display-dp.dts \
	file://display-dpoc.dts \
	file://display-dsi-fhd.dts \
	file://ethernet-dis.dts \
"
