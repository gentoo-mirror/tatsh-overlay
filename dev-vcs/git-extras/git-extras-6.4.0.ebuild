# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Git utilties: repo summary, repl, changelog population, and more."
HOMEPAGE="https://github.com/tj/git-extras"
SRC_URI="https://github.com/tj/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

src_compile() {
	:
}

src_install() {
	emake install PREFIX="${D}/usr" SYSCONFDIR="${D}/etc"
}
