# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake systemd udev

DESCRIPTION="Combine joy-cons using hid-nintendo"
HOMEPAGE="https://github.com/DanielOgorchock/joycond"
SHA="f9a66914622514c13997c2bf7ec20fa98e9dfc1d"
SRC_URI="https://github.com/DanielOgorchock/joycond/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
	dev-libs/libevdev
	virtual/udev"
RDEPEND="${DEPEND}"
IUSE="systemd"

PATCHES=( "${FILESDIR}/${PN}-service-paranoia.patch" )

S="${WORKDIR}/${PN}-${SHA}"

src_prepare() {
	sed -r -e 's|/etc/systemd/|/lib/systemd/|g' \
		-e 's|/etc/modules-load.d/|/lib/modules-load.d/|g' \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_install() {
	newbin "${BUILD_DIR}/${PN}" "${PN}"
	udev_dorules udev/*.rules
	if ! use systemd; then
		mkdir "${D}"/etc/init.d/
		echo -e "#!/sbin/openrc-run\ncommand=/usr/bin/${PN}" \
			> "${D}"/etc/init.d/${PN}
		chmod +x "${D}"/etc/init.d/${PN}
	else
		systemd_dounit systemd/${PN}.service
		insinto /lib/modules-load.d
		doins systemd/${PN}.conf
	fi
}

pkg_postinst() {
	einfo
	einfo "For full functionality, a driver must be installed. You can enable"
	einfo "HID_NINTENDO et al in kernel >= 5.16 or you can install"
	einfo "games-util/hid-nintendo."
	einfo
}
