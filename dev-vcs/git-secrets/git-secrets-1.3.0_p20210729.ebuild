# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Prevents you from committing sensitive info to a git repository."
HOMEPAGE="https://github.com/awslabs/git-secrets"
SHA="b9e96b3212fa06aea65964ff0d5cda84ce935f38"
SRC_URI="https://github.com/awslabs/git-secrets/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

RDEPEND=">=dev-vcs/git-2.10.2"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${SHA}"

src_compile () {
	emake man
}

src_install () {
	emake DESTDIR="${D}" PREFIX=/usr install
	doman "${PN}.1"
	einstalldocs
}
