# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Format conversion tools for Vapoursynth"
HOMEPAGE="https://github.com/EleonoreMizo/fmtconv"
SHA="dd2fcd1ace26125291bebcdcee7e998e42979883"
SRC_URI="https://github.com/EleonoreMizo/fmtconv/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${SHA}/build/unix"

src_prepare () {
	eautoreconf
	default
}

src_install () {
	cd ../..
	einstalldocs
	cd "${S}"
	default
	keepdir /usr/$(get_libdir)/vapoursynth/
	dosym /usr/$(get_libdir)/libfmtconv.so /usr/$(get_libdir)/vapoursynth/libfmtconv.so
}
