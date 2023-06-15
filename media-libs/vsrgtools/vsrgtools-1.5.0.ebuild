# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1 pypi

DESCRIPTION="Wrapper for RGVS, RGSF, and various other functions."
HOMEPAGE="https://pypi.org/project/vsrgtools/"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="media-libs/vstools[${PYTHON_USEDEP}]
	media-libs/vsexprtools[${PYTHON_USEDEP}]
	media-libs/vspyplugin[${PYTHON_USEDEP}]
	media-video/vapoursynth[${PYTHON_USEDEP}]"

S="${WORKDIR}/${P^}"

distutils_enable_tests pytest

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	touch requirements.txt
	distutils-r1_src_prepare
}