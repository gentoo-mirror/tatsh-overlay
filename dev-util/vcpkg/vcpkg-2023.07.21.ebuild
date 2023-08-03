# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Library manager for C/C++ (ports)."
HOMEPAGE="https://github.com/microsoft/vcpkg https://vcpkg.io/"
SRC_URI="https://github.com/microsoft/vcpkg/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-util/vcpkg-tool"

src_prepare() {
	rm -fR .github/ docs/ .git* CONTRIBUTING* LICENSE.txt NOTICE* \
		SECURITY.md bootstrap-* shell.nix || die
	default
}

src_install() {
	mv README* .. || die
	mkdir -p "${D}/usr/share" || die
	cp -R . "${D}/usr/share/${PN}" || die
	mv ../README* . || die
	einstalldocs
	echo "VCPKG_ROOT=${EPREFIX}/usr/share/${PN}" > 99vcpkg
	doenvd 99vcpkg
}
