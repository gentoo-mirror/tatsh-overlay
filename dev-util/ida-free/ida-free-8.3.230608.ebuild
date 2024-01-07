# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop wrapper

DESCRIPTION="Free version of the code analyzer."
HOMEPAGE="https://hex-rays.com/ida-free/"
SRC_URI="https://out7.hex-rays.com/files/idafree83_linux.run -> ${P}.run"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip splitdebug"

RDEPEND="app-crypt/mit-krb5
	dev-libs/glib
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qthelp
	dev-qt/qtnetwork
	dev-qt/qtprintsupport
	dev-qt/qtsql
	dev-qt/qtwidgets
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libglvnd
	sys-apps/dbus
	sys-libs/zlib
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXext
	x11-libs/libdrm
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-renderutil
	x11-libs/xcb-util-wm
"
BDEPEND="app-arch/bitrock-unpacker"

S="${WORKDIR}/ida/programfiles_custom"

src_unpack() {
	cp "${DISTDIR}/${A}" . || die
	bitrock-unpacker "${A}" "${WORKDIR}" || die
	rm "${A}" || die
}

src_install() {
	einstalldocs
	mkdir -p "${D}/opt/ida" || die
	cp -Rv ./* "${D}/opt/ida" || die
	newicon appico64.png "${PN}.png"
	make_wrapper ida64 "${EPREFIX}/opt/ida/ida64" "${EPREFIX}/opt/ida"
	make_desktop_entry ida64 IDA "${PN}"
}
