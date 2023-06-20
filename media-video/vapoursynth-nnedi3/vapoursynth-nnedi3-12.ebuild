# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="nnedi3 filter for VapourSynth"
HOMEPAGE="https://github.com/dubhater/vapoursynth-nnedi3"
SRC_URI="https://github.com/dubhater/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=media-video/vapoursynth-37
	media-video/vapoursynth-nnedi3-weights"
RDEPEND="${DEPEND}"

src_prepare () {
	eautoreconf
	default
}

src_install () {
	default
	dosym -r /usr/lib/libnnedi3.so /usr/lib/vapoursynth/libnnedi3.so
	einstalldocs
}
