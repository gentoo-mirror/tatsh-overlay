# Copyright 2018-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools

DESCRIPTION="A library allowing to download single files from a remote zip archive"
HOMEPAGE="https://github.com/tihmstar/libfragmentzip"
SHA="9561b33155a4bf9a82f09fc4435e7c9fb9619d64"
SRC_URI="https://github.com/tihmstar/libfragmentzip/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

DEPEND="dev-libs/libzip
	net-misc/curl
	dev-libs/tihmstar-libgeneral
	sys-libs/zlib"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${SHA}"

PATCHES=( "${FILESDIR}/configure-ac.patch" )

src_prepare() {
	touch config.h.in
	default
	eautoreconf
}

src_compile() {
	emake
}

src_install() {
	emake install DESTDIR="${D}"
	einstalldocs
}
