# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="PADD provides in-depth information about your Pi-hole."
HOMEPAGE="https://github.com/pi-hole/PADD"
MY_PN="${PN^^}"
SRC_URI="https://github.com/pi-hole/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

RDEPEND="app-shells/bash:0"

PATCHES=(
	"${FILESDIR}/${PN}-0001-more-path-fixes.patch"
)

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	newbin "${PN}.sh" "${PN}"
}

pkg_postinst() {
	if ! has_version net-dns/pihole; then
		ewarn
		ewarn "This package will not work without a working Pi-hole"
		ewarn "installation locally available."
		ewarn
	fi
}
