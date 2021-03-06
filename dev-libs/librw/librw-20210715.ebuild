# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake

DESCRIPTION="A re-implementation of the RenderWare Graphics engine."
HOMEPAGE="https://github.com/aap/librw"
MY_SHA="5ac21e0f2f1cb63f6fb73da0e62d275b137260db"
SRC_URI="https://github.com/aap/librw/archive/${MY_SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="tools"

RDEPEND="media-libs/glfw
	media-libs/libsdl2"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${MY_SHA}"

src_configure() {
	local mycmakeargs=(
		-DLIBRW_TOOLS=$(usex tools)
		-DLIBRW_INSTALL=ON
	)
	cmake_src_configure
}
