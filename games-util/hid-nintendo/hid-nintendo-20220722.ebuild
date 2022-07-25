# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

DESCRIPTION="A Nintendo HID kernel module"
HOMEPAGE="https://github.com/nicman23/dkms-hid-nintendo https://github.com/DanielOgorchock/linux"
SHA="2712136b19eed75bff01c1a6ffe2a23daf78a7bb"
SRC_URI="https://github.com/nicman23/dkms-hid-nintendo/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64"

S="${WORKDIR}/dkms-${PN}-${SHA}"
MODULE_NAMES="${PN}(kernel/drivers/hid:${S}/src)"
BUILD_TARGETS="-C /usr/src/linux M=${S}/src"

pkg_setup() {
	CONFIG_CHECK="~HID ~HID_GENERIC ~USB_HID ~HIDRAW ~UHID"
	check_extra_config
	linux-mod_pkg_setup
}
