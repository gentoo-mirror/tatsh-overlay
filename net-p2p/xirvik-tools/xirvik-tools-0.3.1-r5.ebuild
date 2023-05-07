# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9,10,11} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="Tools for Xirvik servers."
HOMEPAGE="https://github.com/Tatsh/xirvik-tools"
SRC_URI="https://github.com/Tatsh/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/argcomplete
	dev-python/cached-property
	dev-python/lockfile
	dev-python/paramiko
	dev-python/requests
	dev-python/requests-futures
	dev-python/unidecode
	dev-python/humanize
	dev-python/importlib-metadata
	>=dev-python/typing-extensions-3.7.4.1
	dev-python/benc
	test? (
		dev-python/pytest
		dev-python/requests-mock
	)"

src_test() {
	pytest
}
