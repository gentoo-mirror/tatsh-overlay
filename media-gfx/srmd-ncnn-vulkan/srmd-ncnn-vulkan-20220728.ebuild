# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="SRMD super resolution implemented with ncnn library."
HOMEPAGE="https://github.com/nihui/srmd-ncnn-vulkan"
SRC_URI="https://github.com/nihui/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openmp"

DEPEND="media-libs/vulkan-loader
	media-libs/libwebp:=
	dev-libs/ncnn:=[vulkan]"
RDEPEND="${DEPEND}"
BDEPEND="openmp? ( sys-devel/gcc:=[openmp] )
	dev-util/glslang"

CMAKE_USE_DIR="${S}/src"

src_prepare() {
	sed -e "s|PATHSTR(\"models-srmd\")|PATHSTR(\"${EPREFIX}/usr/share/${PN}/models-srmd\")|g" \
		-i src/main.cpp || die
	cmake_src_prepare
}

src_configure() {
	mycmakeargs=(
		-DUSE_SYSTEM_NCNN=ON
		-DUSE_SYSTEM_WEBP=ON
		"-DGLSLANG_TARGET_DIR=${EPREFIX}/usr/lib64/cmake"
		"$(cmake_use_find_package openmp OpenMP)"
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/${PN}"
	insinto "/usr/share/${PN}"
	doins -r models/models-*
	einstalldocs
}
