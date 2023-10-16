# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_11 )

inherit cmake python-r1 pypi

DESCRIPTION="A Python FFI of nihui/waifu2x-ncnn-vulkan achieved with SWIG."
HOMEPAGE="https://pypi.org/project/waifu2x-ncnn-vulkan-python/"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="dev-libs/ncnn[vulkan]
	dev-util/glslang"
BDEPEND="dev-lang/swig"

MY_PN_U="${PN//-/_}"
S="${WORKDIR}/${P}/${MY_PN_U}"

src_prepare() {
	python_foreach_impl cmake_src_prepare
}

custom_configure() {
	local mycmakeargs=(
		"-DCMAKE_INSTALL_PREFIX=$(python_get_sitedir)/${MY_PN_U}"
		"-DGLSLANG_TARGET_DIR=/usr/$(get_libdir)/cmake"
		"-DPY_VERSION=${EPYTHON:6}"
		-DBUILD_SHARED_LIBS=OFF
		-DCALL_FROM_SETUP_PY=ON
		-DUSE_SYSTEM_NCNN=ON
		-Wno-dev
	)
	cmake_src_configure
}

src_configure() {
	python_foreach_impl custom_configure
}

src_compile() {
	python_foreach_impl cmake_src_compile
}

custom_install() {
	cmake_src_install
	rm -f "${D}/$(python_get_sitedir)/${MY_PN_U}/LICENSE" || die
	grep -E '\s+write_top_level_init="' ../setup.py | sed -re 's/.*"([^"]+)",$/\1/' > "${D}/$(python_get_sitedir)/${MY_PN_U}/__init__.py" || die
}

src_install() {
	python_foreach_impl custom_install
}
