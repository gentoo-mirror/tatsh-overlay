# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Tool for common file formats for the Nintendo Switch."
HOMEPAGE="https://github.com/SciresM/hactool"
SHA="c2c907430e674614223959f0377f5e71f9e44a4a"
SRC_URI="https://github.com/SciresM/hactool/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}-${SHA}"

src_prepare() {
	mv config.mk.template config.mk || die
	default
}

src_install() {
	dobin "${PN}"
	einstalldocs
}
