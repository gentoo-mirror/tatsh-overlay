# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit linux-mod

DESCRIPTION="Kernel module for the embedded controller of MSI laptops."
HOMEPAGE="https://github.com/BeardOverflow/msi-ec"
SHA="56e74c85692cd470d8768594d1b38ec8e4decdac"
SRC_URI="https://github.com/BeardOverflow/msi-ec/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}-${SHA}"

MODULE_NAMES="${PN}()"
BUILD_TARGETS="clean modules"

src_install() {
	linux-mod_src_install
	einstalldocs
}
