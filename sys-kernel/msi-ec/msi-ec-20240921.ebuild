# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit linux-mod-r1

DESCRIPTION="Kernel module for the embedded controller of MSI laptops."
HOMEPAGE="https://github.com/BeardOverflow/msi-ec"
SHA="94c2a45c04a07096e10d7cb1240e1a201a025dc0"
SRC_URI="https://github.com/BeardOverflow/msi-ec/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}-${SHA}"

src_compile() {
	local modlist=( "${PN}" )
	local modargs=( clean modules )
	linux-mod-r1_src_compile
}
