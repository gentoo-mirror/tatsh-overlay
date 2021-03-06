# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Updated and improved Kate editor syntax files and code snippets."
HOMEPAGE="https://github.com/zaufi/kate-stuff"
MY_SHA="4b5af1d0d03940e37829fb34e11de626b8981999"
SRC_URI="https://github.com/zaufi/kate-stuff/archive/${MY_SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${MY_SHA}"

src_install() {
	insinto /usr/share/${PN}
	doins kwin-rules/*
	doins schema/*.kateschema
	insinto /usr/share/org.kde.syntax-highlighting/syntax
	doins syntax/*.xml
	insinto /usr/share/apps/ktexteditor_snippets/data
	doins snippets/*.xml
	einstalldocs
}
