# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MPV_REQ_USE="cplugins,libmpv"
inherit mpv-plugin toolchain-funcs

DESCRIPTION="Set mpv to quiet when stdout/stdout is not a TTY."
HOMEPAGE="https://github.com/AN3223/dotfiles"
SHA="5253da4a436ee2808065b442fc7a768301f56eab"
SRC_URI="https://github.com/AN3223/dotfiles/archive/${SHA}.tar.gz -> AN3223-dotfiles-${SHA:0:7}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

BDEPEND="dev-qt/qtdbus"

MPV_PLUGIN_FILES=( "${PN}.so" )

S="${WORKDIR}/dotfiles-${SHA}/.config/mpv/scripts"

src_compile() {
	"$(tc-getCC)" -o "${PN}.so" "${PN}.c" ${CFLAGS} $(pkg-config --cflags mpv) -shared -fPIC $LDFLAGS || die
}
