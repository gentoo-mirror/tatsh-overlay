# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )
inherit distutils-r1

DESCRIPTION="A lightweight LLVM python binding for writing JIT compilers"
HOMEPAGE="https://pypi.org/project/llvmlite/"
SHA="ed0f625e5ee8b5250b71d4bab58390a5382f6fba"
SRC_URI="https://github.com/numba/llvmlite/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="sys-devel/llvm:14"

PATCHES=( "${FILESDIR}/${PN}-830.patch" )

S="${WORKDIR}/${PN}-${SHA}"

python_compile() {
	export "LLVM_CONFIG=${EPREFIX}/usr/lib/llvm/14/bin/llvm-config"
	distutils-r1_python_compile
}

distutils_enable_tests pytest
